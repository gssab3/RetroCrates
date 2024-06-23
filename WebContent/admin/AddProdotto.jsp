<%@page import="rc.model.UtenteBean"%>
<%@page import="rc.model.OrdineBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="rc.model.ProdottoBean,java.util.*, javax.servlet.RequestDispatcher" %>

<%
	String tipo = (String) request.getParameter("TipoProdotto");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport"  content="initial-scale=1, width=device-width">
<title>RetroCrates</title>
 <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/styles/style.css"/>
 <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/styles/Tabelle.css"/>
 <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/styles/addprodotto.css"/>
  <link rel="shortcut icon" href="images/cocoicon2.ico"/> 
  <script src="${pageContext.request.contextPath}/scripts/sidebar.js" type="text/javascript"></script>
  <script src="${pageContext.request.contextPath}/scripts/cart.js" type="text/javascript"></script>
  <script src="${pageContext.request.contextPath}/scripts/searchbar.js" type="text/javascript"></script>
  <script src="${pageContext.request.contextPath}/scripts/controllofoto.js" type="text/javascript"></script>
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
			<li id="aboutus"><a href="../aboutus.html">Chi Siamo</a>
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
	
	<jsp:include page="../header.jsp"/>
	
	<form id="formRicerca" action="${pageContext.request.contextPath}/RicercaProdottoServlet" method="get"> 
    <input id="barraRicerca" name="query" type="text" placeholder="Cerca nel sito">
    <input id="submitRicerca" type="submit" value="Cerca" >
    <input type="hidden" name="input" value="1">
    <input type="hidden" name="TipoProdotto" value="TUTTI">
	</form>

	<div id="risultatiRicerca"></div>

	<%if(tipo.equals("Console")){ %>
		<div class="addprod">
	
	<form class="Console" action="./AddProdotto" method="POST" enctype="multipart/form-data">
    <label for="IdProdotto">Id Prodotto:</label><br>
    <input type="text" id="IdProdotto" name="IdProdotto" required><br>
    <label for="nome">Nome:</label><br>
    <input type="text" id="nome" name="Nome" required><br>
    <label for="descrizione">Descrizione:</label><br>
    <textarea id="descrizione" name="Descrizione" required></textarea><br>
    <label for="qta">Quantità:</label><br>
    <input type="number" id="qta" name="Qta" min="0" required><br>
    <label for="disponibile">Disponibile:</label><br>
    <input type="checkbox" id="disponibile" name="Disponibile"><br>
    <label for="foto">Foto:</label><br>
    <input type="file" id="foto" name="foto" accept="image/*" onchange="checkFile(this)"><br>
    <p id="fileError" style="color: red;"></p>
    <label for="costo">Costo:</label><br>
    <input type="number" id="costo" name="Costo" min="0" step="0.01" required><br>
    <label for="stelle">Stelle:</label><br>
    <input type="number" id="stelle" name="Stelle" min="1" max="5" step="1" required><br>
    <label for="produttore">Produttore:</label><br>
    <select id="produttore" name="Produttore" required>
        <option value="Sony">Sony</option>
        <option value="Microsoft">Microsoft</option>
        <option value="Nintendo">Nintendo</option>
        <option value="Atari">Atari</option>
        <option value="Sega">Sega</option>
        <option value="Altri">Altri</option>
    </select><br>
    <input type="hidden" id="Genere" name="Genere" value="NULL">
    <input type="hidden" id="Piattaforma" name="Piattaforma" value="NULL">
    <input type="hidden" id="TipoGioco" name="TipoGioco" value="NULL">
    <input type="hidden" id="TipoProdotto" name="TipoProdotto" value="Console">
    <input type="hidden" id="Categoria" name="Categoria" value="NULL">
    <label for="edizione">Edizione:</label><br>
    <select id="edizione" name="Edizione" required>
        <option value="Normale">Normale</option>
        <option value="Esclusiva">Esclusiva</option>
        <option value="RetroCrates">RetroCrates</option>
    </select><br>
    <input type="submit" value="Inserisci">
</form>

</div>
	<%}else if(tipo.equals("Videogioco")){ %>
	
	<div class="addprod">
	<form class="Gioco" action="AddProdotto" method="POST" enctype="multipart/form-data">
    <label for="IdProdotto">Id Prodotto:</label><br>
    <input type="text" name="IdProdotto" id="IdProdotto" required><br>
    <label for="nome">Nome:</label><br>
    <input type="text" id="nome" name="Nome" required><br>
    <label for="descrizione">Descrizione:</label><br>
    <textarea id="descrizione" name="Descrizione" required></textarea><br>
    <label for="qta">Quantità:</label><br>
    <input type="number" id="qta" name="Qta" min="0" required><br>
    <label for="disponibile">Disponibile:</label><br>
    <input type="checkbox" id="disponibile" name="Disponibile"><br>
    <!--   <label for="foto">Foto:</label><br>
    <input type="file" id="foto" name="foto" accept="image/*" onchange="checkFile(this)"><br>
    <p id="fileError" style="color: red;"></p> -->
    <label for="costo">Costo:</label><br>
    <input type="number" id="costo" name="Costo" min="0" step="0.01" required><br>
    <label for="stelle">Stelle:</label><br>
    <input type="number" id="stelle" name="Stelle" min="1" max="5" step="1" required><br>
    <label for="produttore">Produttore:</label><br>
    <select id="produttore" name="Produttore" required>
        <option value="Sony">Sony</option>
        <option value="Microsoft">Microsoft</option>
        <option value="Nintendo">Nintendo</option>
        <option value="Atari">Atari</option>
        <option value="Sega">Sega</option>
        <option value="Altri">Altri</option>
    </select><br>
    <label for="genere">Genere:</label><br>
    <input type="text" id="genere" name="Genere" required><br>
    <label for="piattaforma">Piattaforma:</label><br>
    <input type="text" id="piattaforma" name="Piattaforma" required><br>
    <label for="tipoGioco">Tipo Gioco:</label><br>
    <input type="text" id="tipoGioco" name="TipoGioco" required><br>
    <input type="hidden" id="TipoProdotto" name="TipoProdotto" value="Gioco">
    <input type="hidden" id="Categoria" name="Categoria" value="NULL">
    <label for="edizione">Edizione:</label><br>
    <select id="edizione" name="Edizione" required>
        <option value="Normale">Normale</option>
        <option value="Esclusiva">Esclusiva</option>
        <option value="RetroCrates">RetroCrates</option>
    </select><br>
    <input type="submit" value="Inserisci">
</form>

</div>
<%}else if(tipo.equals("Collezionabile")){ %>
		
		<div class="addprod">
	<form class="Collezionabile" action="./AddProdotto" method="post" enctype="multipart/form-data">
    <label for="IdProdotto">Id Prodotto:</label><br>
    <input type="text" id="IdProdotto" name="IdProdotto" required><br>
    <label for="nome">Nome:</label><br>
    <input type="text" id="nome" name="Nome" required><br>
    <label for="descrizione">Descrizione:</label><br>
    <textarea id="descrizione" name="Descrizione" required></textarea><br>
    <label for="qta">Quantità:</label><br>
    <input type="number" id="qta" name="Qta" min="0" required><br>
    <label for="disponibile">Disponibile:</label><br>
    <input type="checkbox" id="disponibile" name="Disponibile"><br>
    <label for="foto">Foto:</label><br>
    <input type="file" id="foto" name="foto" accept="image/*" onchange="checkFile(this)"><br>
    <p id="fileError" style="color: red;"></p>
    <label for="costo">Costo:</label><br>
    <input type="number" id="costo" name="Costo" min="0" step="0.01" required><br>
    <label for="stelle">Stelle:</label><br>
    <input type="number" id="stelle" name="Stelle" min="1" max="5" step="1" required><br>
    <label for="produttore">Produttore:</label><br>
    <select id="produttore" name="Produttore" required>
        <option value="Sony">Sony</option>
        <option value="Microsoft">Microsoft</option>
        <option value="Nintendo">Nintendo</option>
        <option value="Atari">Atari</option>
        <option value="Sega">Sega</option>
        <option value="Altri">Altri</option>
    </select><br>
    <input type="hidden" id="Genere" name="Genere" value="NULL">
    <input type="hidden" id="Piattaforma" name="Piattaforma" value="NULL">
    <input type="hidden" id="TipoGioco" name="TipoGioco" value="NULL">
    <input type="hidden" id="TipoProdotto" name="TipoProdotto" value="Accessori">
    <input type="hidden" id="Categoria" name="Categoria" value="NULL">
    <label for="edizione">Edizione:</label><br>
    <select id="edizione" name="Edizione" required>
        <option value="Normale">Normale</option>
        <option value="Esclusiva">Esclusiva</option>
        <option value="RetroCrates">RetroCrates</option>
    </select><br>
    <input type="submit" value="Inserisci" onsubmit="validateform()">
</form>

	</div>
<%} %>

<script>
function validateForm() {
    var x = document.forms["Gioco"]["IdProdotto"].value;
    if (x == "") {
        alert("Name must be filled out");
        return false;
    }
}
</script>
<jsp:include page="../footer.jsp"/>


</body>
</html>