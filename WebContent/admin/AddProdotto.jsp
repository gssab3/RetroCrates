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
			<li id="aboutus"><a href="../aboutus.jsp">Chi Siamo</a>
			</li>	
		</ul>
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
    <label for="foto">Foto:</label><br>
    <input type="file" id="foto" name="foto" accept="image/*" onchange="checkFile(this)"><br>
    <p id="fileError" style="color: red;"></p>
    <label for="costo">Costo:</label><br>
    <input type="number" id="costo" name="Costo" min="0" step="0.01" required><br>
    <label for="stelle">Stelle:</label><br>
    <input type="number" id="stelle" name="Stelle" min="1" max="5" step="1" required><br>
    <label for="produttore">Produttore:</label><br>
	    <select id="produttore" name="Produttore" required>
	        <option value="Ubisoft">Ubisoft</option>
	        <option value="Rockstar_Games">Rockstar Games</option>
	        <option value="Activision">Activision</option>
	        <option value="Electronic_Arts">Electronic Arts</option>
	        <option value="Naughty_Dog">Naughty Dog</option>
	        <option value="Microsoft_Studios">Microsoft Studios</option>
	        <option value="Bethesda">Bethesda</option>
	        <option value="Gearbox_Software">Gearbox Software</option>
	        <option value="Epic_Games">Epic Games</option>
	        <option value="Capcom">Capcom</option>
	        <option value="Bandai_Namco_Entertainment">Bandai Namco Entertainment</option>
	        <option value="Konami">Konami</option>
	        <option value="Altri">Altri</option>
	    </select><br> 
    <label for="genere">Genere:</label><br>
		<select id="genere" name="Genere" required>
	        <option value="Action_Adventure">Action Adventure</option>
	        <option value="Picchiaduro">Picchiaduro</option>
	        <option value="RPG">RPG</option>
	    	<option value="Sparatutto">Sparatutto</option>
	    	<option value="Simulazione">Simulazione</option>
	    	<option value="Sport">Sport</option>
	    </select><br>
    <label for="piattaforma">Piattaforma:</label><br>
		<select id="piattaforma" name="Piattaforma" required>
		    <option value="PS1">PS1</option>
		    <option value="PS2">PS2</option>
		    <option value="PS3">PS3</option>
		    <option value="PS4">PS4</option>
		    <option value="PS5">PS5</option>
		    <option value="Xbox">Xbox</option>
		    <option value="Xbox_360">Xbox 360</option>
		    <option value="Xbox_One">Xbox One</option>
		    <option value="Xbox_Series_X_S">Xbox Series X/S</option>
		    <option value="Nintendo_64">Nintendo 64</option>
		    <option value="GameCube">GameCube</option>
		    <option value="Wii">Wii</option>
		    <option value="Wii_U">Wii U</option>
		    <option value="Switch">Switch</option>
		    <option value="Game_Boy">Game Boy</option>
		    <option value="Nintendo_DS">Nintendo DS</option>
		    <option value="Nintendo_3DS">Nintendo 3DS</option>
		    <option value="Sega_Mega_Drive">Sega Mega Drive</option>
		    <option value="Sega_Master_System">Sega Master System</option>
		    <option value="DreamCast">DreamCast</option>
		    <option value="SegaSaturn">SegaSaturn</option>
		    <option value="Atari_2600">Atari 2600</option>
		    <option value="Atari_5200">Atari 5200</option>
		    <option value="Atari_7800">Atari 7800</option>
		    <option value="Altro">Altro</option>
		</select><br>
    <label for="tipoGioco">Tipo di Gioco:</label><br>
		<select id="tipoGioco" name="TipoGioco" required>
		    <option value="Digitale">Digitale</option>
		    <option value="Fisico">Fisico</option>
		</select><br> 
    <input type="hidden" id="TipoProdotto" name="TipoProdotto" value="Gioco">
    <label for="edizione">Edizione:</label><br>
		<select id="edizione" name="Edizione" required>
		    <option value="Standard_Edition">Standard Edition</option>
		    <option value="Bronze_Edition">Bronze Edition</option>
		    <option value="Silver_Edition">Silver Edition</option>
		    <option value="Gold_Edition">Gold Edition</option>
		    <option value="Platinum_Edition">Platinum Edition</option>
		    <option value="Diamond_Edition">Diamond Edition</option>
		    <option value="G_O_T_Y_Edition">Game of the Year Edition</option>
		    <option value="Enhanced_Edition">Enhanced Edition</option>
		    <option value="Ultimate_Edition">Ultimate Edition</option>
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
	        <option value="Funko">Funko</option>
	        <option value="Pokèmon">Pokèmon</option>
	        <option value="BandaiNamco">Bandai Namco</option>
	        <option value="YouTooz">YouTooz</option>
	        <option value="Hasbro">Hasbro</option>
	        <option value="Altri">Altri</option>
	    </select><br>
    <input type="hidden" id="Genere" name="Genere" value="NULL">
    <input type="hidden" id="Piattaforma" name="Piattaforma" value="NULL">
    <input type="hidden" id="TipoGioco" name="TipoGioco" value="NULL">
    <input type="hidden" id="TipoProdotto" name="TipoProdotto" value="Collezionabili">
    <label for="categoria">"Categoria":</label><br>
		<select id="categoria" name="Categoria" required>
		    <option value="Poster">Poster</option>
		    <option value="Gadget">Gadget</option>
		    <option value="Figure">Figure</option>
		    <option value="Plush">Plush</option>
		    <option value="Audio">Audio</option>
		</select><br> 
		<label for="edizione">Edizione:</label><br>
		<select id="edizione" name="Edizione" required>
	        <option value="Normale">Normale</option>
	        <option value="Esclusiva">Esclusiva</option>
	        <option value="RetroCrates">RetroCrates</option>
	    </select><br>  
		<input type="submit" value="Inserisci">
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/scripts/ricerca.js" type="text/javascript"></script>

</body>
</html>