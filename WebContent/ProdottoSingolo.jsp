<%@page import="rc.control.ProdottoServlet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="rc.model.*,java.util.*, javax.servlet.RequestDispatcher, java.io.InputStream,utils.utils" %>
<%@ page import="java.util.Collection" %>
<%
	
	String idprodotto = request.getParameter("IdProdotto");
	
	HttpSession sessione = request.getSession(true);
	CarrelloBean carrellobean = (CarrelloBean) sessione.getAttribute("carrello");
	UtenteBean utente = (UtenteBean) sessione.getAttribute("currentSessionUser");
	ProdottoBean prodotto = (ProdottoBean) request.getAttribute("prodotto");
	if(prodotto == null) {
		System.out.println("Inizio null prodotto singolo");
		response.sendRedirect("./ProdottoServlet?IdProdotto=" + idprodotto);
		return;
	}
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport"  content="initial-scale=1, width=device-width">
<title>RetroCrates</title>
 <link type="text/css" rel="stylesheet" href="styles/style.css"/>
 <link rel="shortcut icon" href="images/cocoicon2.ico"/> 
 <link type="text/css" rel="stylesheet" href="styles/prodotto.css"/>
  <link type="text/css" rel="stylesheet" href="styles/Risultati.css">
 	<script src="scripts/sidebar.js" type="text/javascript"></script>
	<script src="scripts/cart.js" type="text/javascript"></script>
	<script src="scripts/searchbar.js" type="text/javascript"></script>
	<script src="scripts/focusontext.js" type="text/javascript"></script>
</head>
<body>

	<div class="barraNavigazione" id="barraNavigazione"> 
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
		<p>Menu<p>
		<ul id="menu">
			<li id="console"> <a href="TipologiaControl?TipoProdotto=Console&Produttore=TUTTI">Console</a>
			  	<ul>
			  		<%-- Qua ci mettiamo le pagine con la ricerca --%>
					<li id="categoriaconsole"><a href="TipologiaControl?TipoProdotto=Console&Produttore=Sony">Sony</a> </li>
					<li id="categoriaconsole"><a href="TipologiaControl?TipoProdotto=Console&Produttore=Microsoft">Microsoft</a></li>
					<li id="categoriaconsole"><a href="TipologiaControl?TipoProdotto=Console&Produttore=Nintendo">Nintendo</a></li>
					<li id="categoriaconsole"><a href="TipologiaControl?TipoProdotto=Console&Produttore=Sega">Sega</a></li>
					<li id="categoriaconsole"><a href="TipologiaControl?TipoProdotto=Console&Produttore=Atari">Atari</a></li>
					<li id="categoriaconsole"><a href="TipologiaControl?TipoProdotto=Console&Produttore=Altri">Altre</a></li>
				</ul>
			  </li>
			<li id="videogiochi"><a href="TipologiaControl?TipoProdotto=Videogioco&Genere=TUTTI">Videogiochi</a>
				<ul>
			  		<%-- Qua ci mettiamo le pagine con la ricerca --%>
					<li id="genere"><a href="TipologiaControl?TipoProdotto=Videogioco&Genere=Action_Adventure">Action Adventure</a>
					<li id="genere"><a href="TipologiaControl?TipoProdotto=Videogioco&Genere=Picchiaduro">Picchiaduro</a>
					<li id="genere"><a href="TipologiaControl?TipoProdotto=Videogioco&Genere=RPG">RPG</a>
					<li id="genere"><a href="TipologiaControl?TipoProdotto=Videogioco&Genere=Sparatutto">Sparatutto</a>
					<li id="genere"><a href="TipologiaControl?TipoProdotto=Videogioco&Genere=Simulazione">Simulazione</a>
					<li id="genere"><a href="TipologiaControl?TipoProdotto=Videogioco&Genere=Sport">Sport</a>
					<li id="genere"><a href="TipologiaControl?TipoProdotto=Videogioco&Genere=Strategia">Strategia</a>
				</ul>
			</li>
			<li id="collezionabili"><a href="TipologiaControl?TipoProdotto=Collezionabile&Categoria=TUTTI">Collezionabili</a>
				<ul>
					<li id="categoria"><a href="TipologiaControl?TipoProdotto=Collezionabile&Categoria=Poster">Poster</a>
					<li id="categoria"><a href="TipologiaControl?TipoProdotto=Collezionabile&Categoria=Gadget">Gadget</a>
					<li id="categoria"><a href="TipologiaControl?TipoProdotto=Collezionabile&Categoria=Figure">Figure</a>
					<li id="categoria"><a href="TipologiaControl?TipoProdotto=Collezionabile&Categoria=Plush">Plush</a>
					<li id="categoria"><a href="TipologiaControl?TipoProdotto=Collezionabile&Categoria=Audio">Audio</a>
				</ul>
			</li>
			<li id="aboutus"><a href="aboutus.jsp">Chi Siamo</a>
			</li>	
		</ul>
	</div>
	
	
	<jsp:include page="header.jsp"/>
	
	<form id="formRicerca" action="./RicercaProdottoServlet" method="get"> 
    <input id="barraRicerca" name="query" type="text" placeholder="Cerca nel sito">
    <input id="submitRicerca" type="submit" value="Cerca" >
    <input type="hidden" name="input" value="1">
    <input type="hidden" name="TipoProdotto" value="TUTTI">
	</form>

	<div id="risultatiRicerca"></div>
		
		
	 
		<div class="prodottosingolo">
    <%
    if (prodotto != null) {
        if (prodotto.getTipoProdotto().equals("Videogioco")) {
        String image = null;
        if (prodotto.getPicture() != null)
			image = "images/productIMG/" + prodotto.getPicture();
    %>
    
            <div class="immagine-prodotto">
                <% if (image != null) { %>
                    <img src="<%=image%>" alt="ImmagineProdotto" class="imgprodotto">
                <% } else { %>
                    <img src="images/productIMG/noimg.png" class="imgprodotto" alt="ImmagineProdotto">
                <% } %>
            </div>
            
            <div class="info-prodotto">
                <p><%= prodotto.getNome() %></p>
                <p>Quantità Disponibile: <%= prodotto.getQta() %></p>
                <p>Costo: <%= prodotto.getCosto() %>€</p>
                <!--  Stelle  --> 
                	<span> <% for(int i=1; i<=5; i++) {
                		if(prodotto.getStelleTot() >= i)
                			%><img src="images/stellapiena.png"> <% 
                			else
                			%> <img src="images/stellavuota.png"> <%} %></span>
                <p>Produttore: <%= utils.formatta(prodotto.getProduttore())%></p>
                <p>Genere: <%= utils.formatta(prodotto.getGenere()) %></p>
                <p>Piattaforma: <%= utils.formatta(prodotto.getPiattaforma()) %></p>
                <p>Formato: <%= prodotto.getTipoGioco() %></p>
                <p>Edizione: <%= utils.formatta(prodotto.getEdizione()) %></p>
                 <% if (prodotto.getQta() == 0) { %>
            
                <h1>Prodotto Non Disponibile</h1>
                
            <% } else { if(utente != null && utente.getTipo().equals("Admin")) {} else {%>
            
                <form action="CarrelloServlet" method="get">
	                <button class="aggiungi" type="submit">Aggiungi al Carrello</button>
	                <input type="hidden" name="qtacar" value="1">
	                <input type="hidden" name="Azione" value="aggiungi">
	    			<input type="hidden" name="idprodotto" value="<%= prodotto.getIdProdotto()%>">
                </form>
                
            <% } 
            }%>
            </div>
            
            <div class="descrizione-prodotto">
                <p><%= prodotto.getDescr() %></p>
            </div>
            
           
    <%
        } else if (prodotto.getTipoProdotto().equals("Console")) {
        	String image = null;
            if (prodotto.getPicture() != null) {
            	image = "images/productIMG/" + prodotto.getPicture();
    		}
    %>
    
            <div class="immagine-prodotto">
                <% if (image != null) { %>
                    <img src="<%=image%>" alt="ImmagineProdotto" class="imgprodotto">
                <% } else { %>
                    <img src="images/productIMG/noimg.png" class="imgprodotto" alt="ImmagineProdotto">
                <% } %>
            </div>
            
            <div class="info-prodotto">
                <p><%= prodotto.getNome() %></p>
                <p>Quantità Disponibile: <%= prodotto.getQta() %></p>
                <p>Costo: <%= prodotto.getCosto() %>€</p>
                <!--  Stelle  --> 
                	<span> <% for(int i=1; i<=5; i++) {
                		if(prodotto.getStelleTot() >= i)
                			%><img src="images/stellapiena.png"> <% 
                			else
                			%> <img src="images/stellavuota.png"> <%} %></span>
                <p>Produttore: <%= utils.formatta(prodotto.getProduttore()) %></p>
                 <% if (prodotto.getQta() == 0) { %>
            
                <h1>Prodotto Non Disponibile</h1>
                
            <% } else {
            	if(utente != null && utente.getTipo().equals("Admin")) {
            	}
            	else { %>
                <form action="CarrelloServlet" method="get">
	                <button class="aggiungi" type="submit">Aggiungi al Carrello</button>
	                <input type="hidden" name="qtacar" value="1">
	                <input type="hidden" name="Azione" value="aggiungi">
	    			<input type="hidden" name="idprodotto" value="<%= prodotto.getIdProdotto()%>">
                </form>
                
            <% } 
            	} %>
            </div>
            
            <div class="descrizione-prodotto">
                <p><%= prodotto.getDescr() %></p>
            </div>
            
           
            
    <%
        } else if (prodotto.getTipoProdotto().equals("Collezionabile")) {
        	String image = null;
            if (prodotto.getPicture() != null) {
            	image = "images/productIMG/" + prodotto.getPicture();
    		}
    %>
            <div class="immagine-prodotto">
                <% if (image != null) { %>
                    <img src="<%=image%>" alt="ImmagineProdotto" class="imgprodotto">
                <% } else { %>
                    <img src="images/productIMG/noimg.png" class="imgprodotto" alt="ImmagineProdotto">
                <% } %>
            </div>
            <div class="info-prodotto">
                <p><%= prodotto.getNome() %></p>
                <p>Quantità Disponibile: <%= prodotto.getQta() %></p>
                <p>Costo: <%= prodotto.getCosto() %>€</p>
                <!--  Stelle  --> 
                	<span> <% for(int i=1; i<=5; i++) {
                		if(prodotto.getStelleTot() >= i)
                			%><img src="images/stellapiena.png"> <% 
                			else
                			%> <img src="images/stellavuota.png"> <%} %></span>
                <p>Produttore: <%= utils.formatta(prodotto.getProduttore()) %></p>
                <p>Categoria: <%= utils.formatta(prodotto.getCategoria()) %></p>
                <p>Edizione: <%= utils.formatta(prodotto.getEdizione()) %></p>
                 <% if (prodotto.getQta() == 0) { %>
            
                <h1>Prodotto Non Disponibile</h1>
                
            <% } else { if(utente != null && utente.getTipo().equals("Admin")) {} else {%>
            
            	<form action="CarrelloServlet" method="get">
	                <button class="aggiungi" type="submit">Aggiungi al Carrello</button>
	                <input type="hidden" name="qtacar" value="1">
	                <input type="hidden" name="Azione" value="aggiungi">
	    			<input type="hidden" name="idprodotto" value="<%= prodotto.getIdProdotto()%>">
                </form>
                
            <% } 
            }%>
            </div>
            <div class="descrizione-prodotto">
                <p><%= prodotto.getDescr() %></p>
            </div>
            
           
    <%
        }
    }
    %>
</div>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="scripts/ricerca.js" type="text/javascript"></script>
		
		
	<jsp:include page="footer.jsp"/>
	
</body>
</html>