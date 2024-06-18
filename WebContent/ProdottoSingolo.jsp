<%@page import="rc.controller.ProdottoServlet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="rc.model.ProdottoBean,java.util.*, javax.servlet.RequestDispatcher" %>
<%@ page import="java.util.Collection" %>
<%
	
	String idprodotto = request.getParameter("IdProdotto");
	

	ProdottoBean prodotto = (ProdottoBean) request.getAttribute("prodotto");
	int x;	
	if(prodotto == null) {
		response.sendRedirect("./ProdottoServlet?IdProdotto=" + idprodotto);
		return;
	} else if(prodotto.getRecTot()==0){
		x=1;
	}else{
		x=prodotto.getRecTot();
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
			<li id="aboutus"><a href="aboutus.html">Chi Siamo</a>
			</li>	
		</ul>
	</div>
	
	
	<div class="cart" id="cart">
		<a href="javascript:void(0)" class="closecart" onclick="closeCart()">×</a>
		<p>Il Tuo Carrello</p>
		<br>
		<br>
		<br>
		<p class="carrello"><a href="paginadelcarrello">Vai alla pagina del carrello</a></p>
	</div>
	
	<jsp:include page="header.jsp"/>
	
	<input id="barraRicerca" type="text" placeholder="Cerca nel sito">
		
		
	 
		<div class = "prodottosingolo">
				<%
				if (prodotto != null) {
					if(prodotto.getTipoProdotto().equals("Videogioco")){
						
						%>
						<% if(prodotto.getPicture()!=null){ %>
							<img src = "<%=prodotto.getPicture()%>" alt = "ImmagineProdotto" style="width: 400px">
						<%
							}
							else
							{
						%>
							<img src = "images/productIMG/noimg.png" alt = "ImmagineProdotto" style="width: 400px">
						<%
							}
						%>
						<p><%=prodotto.getNome()%></p>
						<p><%=prodotto.getDescr()%></p>
						<p><%=prodotto.getQta()%></p>
						<p><%=prodotto.getCosto()%></p>
						<p><%=(prodotto.getStelleTot())/(x)%></p>
						<p><%=prodotto.getRecTot()%></p>
						<p><%=prodotto.getProduttore()%></p>
						<p><%=prodotto.getGenere()%></p>
						<p><%=prodotto.getPiattaforma()%></p>
						<p><%=prodotto.getTipoGioco()%></p>
						<p><%=prodotto.getEdizione()%></p>
						<%
						
					}
					else if(prodotto.getTipoProdotto().equals("Console")){
						
						%>
						<% if(prodotto.getPicture()!=null){ %>
							<img src = "<%=prodotto.getPicture()%>" alt = "ImmagineProdotto" style="width: 400px">
						<%
							}
							else
							{
						%>
							<img src = "images/productIMG/noimg.png" alt = "ImmagineProdotto" style="width: 400px">
						<%
							}
						%>
						<p><%=prodotto.getNome()%></p>
						<p><%=prodotto.getDescr()%></p>
						<p><%=prodotto.getQta()%></p>
						<p><%=prodotto.getCosto()%></p>
						<p><%=(prodotto.getStelleTot())/(x)%></p>
						<p><%=prodotto.getRecTot()%></p>
						<p><%=prodotto.getProduttore()%></p>
						<%
						
					}
					else if(prodotto.getTipoProdotto().equals("Collezionabile")){
						
						%>
						<% if(prodotto.getPicture()!=null){ %>
							<img src = "<%=prodotto.getPicture()%>" alt = "ImmagineProdotto" style="width: 400px">
						<%
							}
							else
							{
						%>
							<img src = "images/productIMG/noimg.png" alt = "ImmagineProdotto" style="width: 400px">
						<%
							}
						%>
						<p><%=prodotto.getNome()%></p>
						<p><%=prodotto.getDescr()%></p>
						<p><%=prodotto.getQta()%></p>
						<p><%=prodotto.getCosto()%></p>
						<p><%=(prodotto.getStelleTot())/(x)%></p>
						<p><%=prodotto.getRecTot()%></p>
						<p><%=prodotto.getProduttore()%></p>
						<p><%=prodotto.getCategoria()%></p>
						<p><%=prodotto.getEdizione()%></p>
						<%
						
					}
				}
				%>
		</div>
		
		
	<jsp:include page="footer.jsp"/>
	
</body>
</html>