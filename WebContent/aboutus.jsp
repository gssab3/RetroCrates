<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="rc.model.ProdottoBean,java.util.*, javax.servlet.RequestDispatcher, java.io.InputStream, rc.model.UtenteBean" %>

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
	
	
	<div class="cart" id="cart">
		<a href="javascript:void(0)" class="closecart" onclick="closeCart()">×</a>
		<p>Il Tuo Carrello</p>
		<br>
		<br>
		<br>
		<p class="carrello"><a href="paginadelcarrello">Vai alla pagina del carrello</a></p>
	</div>
	
	
	<jsp:include page="header.jsp"/>
	
	<form id="formRicerca" action="./RicercaProdottoServlet" method="get"> 
    <input id="barraRicerca" name="query" type="text" placeholder="Cerca nel sito">
    <input id="submitRicerca" type="submit" value="Cerca" >
    <input type="hidden" name="input" value="1">
    <input type="hidden" name="TipoProdotto" value="TUTTI">
	</form>

	<div id="risultatiRicerca"></div>
	<div class="aboutus">
        <h1>Chi Siamo - RetroCrates</h1>
        <p>Benvenuti su RetroCrates, un sito dedicato a riportare in vita la magia senza 
        tempo dei videogiochi retrò. La nostra missione è far rivivere le emozioni e la 
        nostalgia di un'epoca in cui i videogiochi erano più di un semplice passatempo, 
        ma una vera e propria forma d'arte e di intrattenimento.</p>
        
        <h2>La Nostra Offerta</h2>
        <p>Su RetroCrates, offriamo una vasta selezione di titoli classici che hanno segnato 
        un'epoca, diventando autentici capolavori. Questi giochi, spesso dimenticati con il 
        passare del tempo, sono pronti per essere riscoperti e apprezzati ancora una volta. 
        Non ci limitiamo solo ai titoli più famosi, ma esploriamo anche gemme nascoste che 
        meritano di essere conosciute. La nostra collezione comprende una gamma diversificata 
        di giochi, dai pionieri del genere arcade ai leggendari RPG e platform che hanno definito 
        intere generazioni di giocatori.</p>
        
        <h2>La Nostra Missione</h2>
        <p>RetroCrates non è solo un negozio, ma il tuo portale per l’era d’oro dei videogiochi. 
        La nostra passione per il retrogaming ci spinge a curare con attenzione ogni singolo titolo, 
        garantendo che ogni gioco offerto sia in condizioni eccellenti e pronto per essere giocato. 
        Siamo convinti che ogni gioco abbia una storia unica da raccontare e che meriti di essere 
        tramandata alle future generazioni di gamer.</p>
        
        <h2>Perché Sceglierci?</h2>
        <p>In un mondo in cui la tecnologia avanza rapidamente, è facile dimenticare le radici del gaming moderno. 
        RetroCrates si impegna a preservare questa eredità, offrendo ai giocatori di oggi e di ieri 
        l'opportunità di rivivere le avventure che hanno plasmato la storia dei videogiochi. 
        Che tu sia un collezionista appassionato, un nostalgico in cerca di rivivere i propri ricordi d'infanzia, 
        o un nuovo giocatore curioso di scoprire le origini del gaming, 
        RetroCrates è il luogo perfetto per te.</p>
        
        <h2>Unisciti a Noi</h2>
        <p>Ti invitiamo a esplorare il nostro catalogo e a unirti alla comunità di appassionati 
        che condividono la nostra stessa passione per i videogiochi retrò. 
        Su RetroCrates, la tua avventura nell’era d’oro dei videogiochi inizia qui. 
        Scopri, gioca e rivivi i momenti indimenticabili che hanno fatto la storia del gaming.</p>
    </div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="scripts/ricerca.js" type="text/javascript"></script>
	
	<jsp:include page="footer.jsp"/>
	
</body>
</html>