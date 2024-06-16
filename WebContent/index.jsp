<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="rc.model.ProdottoBean,java.util.*, javax.servlet.RequestDispatcher" %>

<%
/*
	String tipologia = request.getParameter("TipoProdotto");
	String produttore = request.getParameter("Produttore");	

	Collection<?> prodotti = (Collection<?>) request.getAttribute("prodotti");
	if(prodotti == null) {
		response.sendRedirect("./TipologiaControl?TipoProdotto=TUTTI&Produttore=TUTTI");	
		return;
	} */
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport"  content="initial-scale=1, width=device-width">
<title>RetroCrates</title>
 <link type="text/css" rel="stylesheet" href="css/style.css"/>
 <link rel="shortcut icon" href="images/cocoicon2.ico"/> 
 	<link type="text/css" rel="stylesheet" href="css/paginaprodotti.css"/>
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
					<li id="sony"><a href="TipologiaControl?TipoProdotto=Console&Produttore=Sony">Sony</a> </li>
					<li id="microsoft"><a href="TipologiaControl?TipoProdotto=Console&Produttore=Microsoft">Microsoft</a></li>
					<li id="nintendo"><a href="TipologiaControl?TipoProdotto=Console&Produttore=Nintendo">Nintendo</a></li>
					<li id="sega"><a href="TipologiaControl?TipoProdotto=Console&Produttore=Sega">Sega</a></li>
					<li id="atari"><a href="TipologiaControl?TipoProdotto=Console&Produttore=Atari">Atari</a></li>
					<li id="altre"><a href="TipologiaControl?TipoProdotto=Console&Produttore=Altri">Altre</a></li>
				</ul>
			  </li>
			<li id="videogiochi"><a href="TipologiaControl?TipoProdotto=Videogioco&Genere=TUTTI">Videogiochi</a>
				<ul>
			  		<%-- Qua ci mettiamo le pagine con la ricerca --%>
					<li id="genere"><a href="TipologiaControl?TipoProdotto=Videogioco&Genere=Action_Adventure">Action Adventure</a>
				</ul>
			</li>
			<li id="collezionabili"><a href="TipologiaControl?TipoProdotto=Collezionabili">Collezionabili</a>
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
	
	<div class="prova">
	ciao
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
