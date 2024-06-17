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
 <link type="text/css" rel="stylesheet" href="css/style.css"/>
 <link type="text/css" rel="stylesheet" href="css/paginaprodotti.css"/>
 <link rel="shortcut icon" href="images/cocoicon2.ico"/> 
 	<script src="js/sidebar.js" type="text/javascript"></script>
	<script src="js/cart.js" type="text/javascript"></script>
	<script src="js/searchbar.js" type="text/javascript"></script>
</head>
<body >

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
	
	
	<header>
		<div class="TastoMenu" >
			<span style="font-size:30px;cursor:pointer" onclick="openNav()">
				<img src="images/iconamenu.png" alt="open">
			</span>
		</div>
		
		<div class="TastoRicerca" >
			<span style="font-size:30px;cursor:pointer" onclick="openSearch()">
				<img src="images/lenteicona.png" alt="openSearch">
			</span>
		</div>
		
		<div class="ContentHeader">
			<a href="index.jsp" style="cursor: pointer"><img alt="logo RetroCrates" src="images/logofinale.png"></a>
		</div>
		
		
		<%-- Qui dobbiamo fare un if, che se siamo loggati il tato login reinderizza al profilo e non alla pagina di login --%>
		<div class="TastoLogin">
			<span style="font-size:30px;cursor:pointer">
				<a href="login.jsp"><img src="images/crashIconLogin.png" alt="openLog"></a>
			</span>
		</div>
		
		<%-- 
		<div class="TastoAccount">
			<span style="font-size:30px;cursor:pointer">
				<a href="account.jsp"><img src="images/fotoprofilodell'utente" alt="open"></a>
			</span>
		</div> --%>	
		
		<div class="TastoCarrello">
			<span style="font-size:30px;cursor:pointer" onclick="openCart()">
				<img src="images/cart.png" alt="opencart">
			</span>
		</div> 
	</header>
	
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
		
		
	<footer>
		<div class="rigafooter">
			
				<div class="colonnafooter">
					<img src="images/logofinale.png" class="logofooter">
					<p class="azienda">RetroCrates Inc.</p>
				</div>
				
				<div class="colonnafooter">
					<h3>About Us</h3>
					<p>RetroCrates è un sito che punta a riportare in vita la magia dei videogiochi retrò. 
					Offriamo una vasta selezione di titoli classici, divenuti ormai capolavori 
					dimenticati, ma non solo.
					RetroCrates, il tuo portale per l’era d’oro dei videogiochi. </p>
					<p class="email-id" style="cursor:pointer;"><a href="mailto:s.davanzo5@studenti.unisa.it">s.davanzo5@studenti.unisa.it</a></p>
					<p class="email-id" style="cursor:pointer;"><a href="mailto:g.sabetta3@studenti.unisa.it">g.sabetta3@studenti.unisa.it</a></p>
					<h4>+39 123 456 7890</h4>
				</div>
				
				<div class="colonnafooter">
					<h3>Naviga</h3>
					<ul>
						<li><a href="index.jsp">Home</a>
						<li><a href="#">Account</a>
						<li><a href="giocomagico.jsp">Ti senti Fortunato?</a>
					</ul>
					
				</div>
				
			
			</div>
			
			<hr>
			<p class="copyright"> RetroCrates Inc. &copy; - All Rights Reserved</p>
	</footer>
</body>
</html>