<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="rc.model.ProdottoBean,java.util.*, javax.servlet.RequestDispatcher" %>
<%@ page import="java.util.Collection" %>
<%

	String tipologia = request.getParameter("TipoProdotto");

	String produttore = request.getParameter("Produttore");
	String genere = request.getParameter("Genere");
	String categoria = request.getParameter("Categoria");
	
	Collection<?> prodotti = (Collection<?>) request.getAttribute("prodotti");
	
	if(tipologia.equals("Console")){
		 if(prodotti == null) {
			String redirectURL = "./ConsoleServlet?TipoProdotto=" + tipologia;
			if(produttore != null && !produttore.isEmpty()) {
				redirectURL += "&Produttore=" + produttore;
			}
			response.sendRedirect(redirectURL);
			return;
		} 
	 }else if(tipologia.equals("Videogioco")){
		if(prodotti == null) {
			String redirectURL = "./VideogiochiServlet?TipoProdotto=" + tipologia;
			if(genere != null && !genere.isEmpty()) {
				redirectURL += "&Genere=" + genere;
			}
			response.sendRedirect(redirectURL);
			return;
		} 
	}else if(tipologia.equals("Collezionabile")){	
		if(prodotti == null) {
			String redirectURL = "./CollezionabileServlet?TipoProdotto=" + tipologia;
			if(categoria != null && !categoria.isEmpty()) {
				redirectURL += "&Categoria=" + categoria;
			}
			response.sendRedirect(redirectURL);
			return;
		} 
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
		
		
	 	<h1 style="text-align: center;"> <%=tipologia %></h1> 
		
	
		
		<div class = "rigaprodotti" style="margin-top: 20px">
				<%
				if (prodotti != null && prodotti.size() != 0) {
					Iterator<?> it = prodotti.iterator();
					while (it.hasNext()) {
						ProdottoBean bean = (ProdottoBean) it.next();
						Float costo = bean.getCosto();
						String image="NULL"; //= "images/productIMG/" + bean.getPicture();
				%>
				<div class="colonnaprodotto">
					<div class = "immagineprodotto">
						<% if(image!="NULL"){ %>
							<a href="Servletprodottsingola"><img src = "<%=image%>" alt = "ImmagineProdotto"></a>
						<%
							}
							else
							{
						%>
							<a href="Servletprodottosingola"><img src = "images/productIMG/noimg.png" alt = "ImmagineProdotto" style="width: 200px"></a>
						<%
							}
						%>
					</div>
					<div>
						<p class = "nome"><%=bean.getNome()%></p>
						<p class = "prezzo"><%=costo%>€</p>
					</div>	
				</div>
				<%
					}
				} else {
					%>
					<p>Nessun prodotto disponibile.</p>
				<%
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