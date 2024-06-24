<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="rc.model.ProdottoBean,rc.model.CarrelloBean, java.util.*, javax.servlet.RequestDispatcher, java.io.InputStream, rc.model.UtenteBean" %>

<%
	HttpSession sessione = request.getSession(true);
	if(sessione.getAttribute("currentSessionUser") == null) {
		response.sendRedirect(request.getContextPath()+"/login.jsp");	
		return;
	}
	
	UtenteBean utenteBean = (UtenteBean) sessione.getAttribute("currentSessionUser");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport"  content="initial-scale=1, width=device-width">
<title>RetroCrates</title>
<style>
        .error {
            color: red;
        }
    </style>
 <link type="text/css" rel="stylesheet" href="styles/style.css"/>
 <link type="text/css" rel="stylesheet" href="styles/Risultati.css"/>
 <link type="text/css" rel="stylesheet" href="styles/Tabelle.css"/>
 <link rel="shortcut icon" href="images/cocoicon2.ico"/> 
 	<link type="text/css" rel="stylesheet" href="styles/paginaprodotti.css"/>
 	<script src="scripts/sidebar.js" type="text/javascript"></script>
	<script src="scripts/cart.js" type="text/javascript"></script>
	<script src="scripts/searchbar.js" type="text/javascript"></script>
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
	

<div class="contieniform">
    <form action="CarrelloServlet" method="post" onsubmit="return validateCardDetails(this)">
        <!-- Numero della carta -->
        <label for="cardNumber">Numero della carta:</label>
        <input type="text" id="cardNumber" name="cardNumber" required onblur="checkCardNumberField()">
        <span id="errCardNumber" class="error"></span>
        <br>

        <!-- Codice speciale (CVV/CVC) -->
        <label for="cvv">Codice speciale (CVV/CVC):</label>
        <input type="text" id="cvv" name="cvv" required onblur="checkCVVField()">
        <span id="errCVV" class="error"></span>
        <br>

        <!-- Intestatario -->
        <label for="cardholderName">Intestatario:</label>
        <input type="text" id="cardholderName" name="cardholderName" required onblur="checkCardholderNameField()">
        <span id="errCardholderName" class="error"></span>
        <br>

        <!-- Data di scadenza -->
        <label for="expirationDate">Data di scadenza (MM/YY):</label>
        <input type="text" id="expirationDate" name="expirationDate" required onblur="checkExpirationDateField()">
        <span id="errExpirationDate" class="error"></span>
        <br>

        <label for="Destinazione">Destinazione:</label>
        <input type="text" id="Destinazione" name="Destinazione" required>
        <span class="error"></span>
        <br>
        
        <input type="hidden" name="username" value="<%=utenteBean.getUsername()%>">
		<input type="hidden" name="Azione" value="acquista">
        <input type="submit" value="Checkout">
    </form>
</div>
    <script>
        function checkCardNumberField() {
            var cardNumber = document.getElementById("cardNumber");
            if (!checkCardNumber(cardNumber)) {
                document.getElementById("errCardNumber").textContent = "Numero di carta non valido";
            } else {
                document.getElementById("errCardNumber").textContent = "";
            }
        }

        function checkCVVField() {
            var cvv = document.getElementById("cvv");
            if (!checkCVV(cvv)) {
                document.getElementById("errCVV").textContent = "CVV non valido";
            } else {
                document.getElementById("errCVV").textContent = "";
            }
        }

        function checkCardholderNameField() {
            var cardholderName = document.getElementById("cardholderName");
            if (!checkCardholderName(cardholderName)) {
                document.getElementById("errCardholderName").textContent = "Nome del titolare non valido";
            } else {
                document.getElementById("errCardholderName").textContent = "";
            }
        }

        function checkExpirationDateField() {
            var expirationDate = document.getElementById("expirationDate");
            if (!checkExpirationDate(expirationDate)) {
                document.getElementById("errExpirationDate").textContent = "Data di scadenza non valida";
            } else {
                document.getElementById("errExpirationDate").textContent = "";
            }
        }
    </script>

	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="scripts/ricerca.js" type="text/javascript"></script>
	<script src="scripts/acquisto.js" type="text/javascript"></script>
	
	<jsp:include page="footer.jsp"/>
</body>
</html>