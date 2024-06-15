<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="rc.model.ProdottoBean,java.util.*, javax.servlet.RequestDispatcher" %>

<%
	
	Collection<?> prodotti = (Collection<?>) request.getAttribute("prodotti");
	if(prodotti == null) {
		response.sendRedirect("./ProdottoServlet?TipoProdotto=" + request.getParameter("TipoProdotto"));	
		return;
	} 
	
	String tipologia = request.getParameter("TipoProdotto");
	if (tipologia == null) {
		tipologia = "Nessuna tipologia specificata";
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport"  content="initial-scale=1, width=device-width">
<title>RetroCrates</title>
 <link type="text/css" rel="stylesheet" href="css/style.css"/>
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
			<li id="console"> <a href="ProdottoControl?TipoProdotto=Console">Console</a>
			  	<ul>
			  		<%-- Qua ci mettiamo le pagine con la ricerca --%>
					<li id="sony"><a href="console.jsp">Sony</a> </li>
					<li id="microsoft"><a href="console.jsp">Microsoft</a></li>
					<li id="nintendo"><a href="console.jsp">Nintendo</a></li>
					<li id="sega"><a href="console.jsp">Sega</a></li>
					<li id="atari"><a href="console.jsp">Atari</a></li>
					<li id="altre"><a href="console.jsp">Altre</a></li>
				</ul>
			  </li>
			<li id="videogiochi"><a href="videogiochi.jsp">Videogiochi</a>
				<ul>
			  		<%-- Qua ci mettiamo le pagine con la ricerca --%>
					<li id="genere"><a href="videogiochi.jsp">Genere</a>
				</ul>
			</li>
			<li id="collezionabili"><a href="collezionabili.jsp">Collezionabili</a>
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
		
		
		<h1> <%=tipologia %></h1>
		
		
		<div class = "riga" style="margin-top: 20px">
				<%
				if (prodotti != null && prodotti.size() != 0) {
					Iterator<?> it = prodotti.iterator();
					while (it.hasNext()) {
						ProdottoBean bean = (ProdottoBean) it.next();
						Float costo = bean.getCosto();
						String image = "images/immaginiprodotto/" + bean.getPicture();
				%>
				<div class="colonna">
					<div class = "immagineprodotto">
						<img src = "<%=image%>" alt = "img/productIMG/noimg.jpg">
					</div>
					<div>
						<p class = "prezzo"><%=costo%></p>
						<p class = "nome"><%=bean.getNome()%></p>
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