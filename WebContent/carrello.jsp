<%@page import="rc.model.CarrelloBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="rc.model.*,java.util.*, javax.servlet.RequestDispatcher" %>

<%
	
	HttpSession sessione = request.getSession(true);
	CarrelloBean carrellobean = (CarrelloBean) sessione.getAttribute("carrello");

%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport"  content="initial-scale=1, width=device-width">
<title>RetroCrates</title>
 <link type="text/css" rel="stylesheet" href="styles/style.css"/>
 <link type="text/css" rel="stylesheet" href="styles/Risultati.css"/>
<link type="text/css" rel="stylesheet" href="styles/Tabelle.css"/>
 <link rel="shortcut icon" href="images/cocoicon2.ico"/> 
 	<link type="text/css" rel="stylesheet" href="styles/paginaprodotti.css"/>
 	<script src="scripts/sidebar.js" type="text/javascript"></script>
	<script src="scripts/cart.js" type="text/javascript"></script>
	<script src="scripts/searchbar.js" type="text/javascript"></script>
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
	
	<table class="tabella">
		<tr>
			<th>Immagine</th>
			<th>Prodotto</th>
			<th>Prezzo</th>
			<th>Quantità</th>
			<th>Totale</th>
			<th>Operazioni</th>
			<th>Svuota</th>
			<th>Buy</th>
		</tr>
		<%
		
		double somma = 0;


		if (carrellobean != null && carrellobean.getCarrello().size() != 0) {
			Iterator<?> it = carrellobean.getCarrello().iterator();
			int numProdotti = carrellobean.getCarrello().size();
		    int i = 0;
			while (it.hasNext()) {
				ProdottoBean prodotto = (ProdottoBean) it.next();
				
				Float costo = prodotto.getCosto();
			
				Float costototale = prodotto.getCosto() * prodotto.getQta();
				somma += costototale;
			
				String image = "images/productIMG/" + prodotto.getPicture();
		%>
		<tr>
	<td>
				<div class="">
					<img src="<%=image%>" style="width: 160px; height: 160px">
				</div>
			</td>
			<td><%=prodotto.getNome()%></td>
			<td id=""><%=costo%> &euro;</td>
			<td><%=prodotto.getQta()%>
			</td>
			<td class="" id=""><%=costototale%> &euro;</td>
			<td><a href="CarrelloServlet?Azione=diminuisci&idprodotto=<%=prodotto.getIdProdotto()%>"><img src="${pageContext.request.contextPath}/images/minus.png"></a> <br> <a href="CarrelloServlet?Azione=aggiungi&idprodotto=<%=prodotto.getIdProdotto()%>"><img src="${pageContext.request.contextPath}/images/piu.png"></a></td>
			<% if (i == 0) { %>
                <td rowspan="<%=numProdotti%>"><a href="CarrelloServlet?Azione=svuota">Svuota</a></td>
            <% } %>
            <% if (i == 0) { %>
                <td rowspan="<%=numProdotti%>"><a href="checkout.jsp">Buy</a></td>
            <% } i++; %>
		</tr>
		<% 		}
			}
		%>
	</table>
	
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="scripts/ricerca.js" type="text/javascript"></script>
	
	<jsp:include page="footer.jsp"/>
	
</body>
</html>