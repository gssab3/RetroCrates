<%@page import="rc.model.OrdineBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="rc.model.*,java.util.*, javax.servlet.RequestDispatcher, java.util.*" %>

<%
    String utenteId = request.getParameter("utente");
    String datax = request.getParameter("datax");
    String datay = request.getParameter("datay");
    String sort = request.getParameter("sort");

    Collection<?> ordini = (Collection<?>) request.getAttribute("ordini");

    if (ordini == null) {
        if ("0".equals(sort)) {
            String redirectURL = "/RetroCrates/VediOrdini?sort=0&utente=TUTTI&datax=NULL&datay=NULL";
            response.sendRedirect(redirectURL);
            return;
        } else if ("1".equals(sort)) {
            if (datax != null || datay != null) {
                String redirectURL = "/RetroCrates/VediOrdini?sort=0&utente=TUTTI&datax=" + (datax != null ? datax : "NULL") + "&datay=" + (datay != null ? datay : "NULL");
                response.sendRedirect(redirectURL);
                return;
            }
        } else if ("2".equals(sort)) {
            String redirectURL = "/RetroCrates/VediOrdini?sort=0&utente=" + utenteId + "&datax=NULL&datay=NULL";
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
 <link type="text/css" rel="stylesheet" href="styles/style.css"/>
 <link type="text/css" rel="stylesheet" href="styles/Tabelle.css"/>
 <link rel="shortcut icon" href="images/cocoicon2.ico"/> 
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
	
	<jsp:include page="../header.jsp"/>
	
	<form id="formRicerca" action="./RicercaProdottoServlet" method="get"> 
    <input id="barraRicerca" name="query" type="text" placeholder="Cerca nel sito">
    <input id="submitRicerca" type="submit" value="Cerca" >
    <input type="hidden" name="input" value="1">
    <input type="hidden" name="TipoProdotto" value="TUTTI">
	</form>

	<div id="risultatiRicerca"></div>

	<div class="contieniform">
	<form method="GET" action="VediOrdini">
		<label>Data di Partenza: </label>
        <input type="date" name="datax">
        <br>
        <label>Data di Fine: </label>
        <input type="date" name="datay">
        <br>
        <input type="hidden" name="sort" value="1">
        <input type="hidden" name="utente" value="TUTTI">
        <input type="submit" value="Cerca" class="cerca">
	</form>
	</div>

	<table class="tabella">
		<tr>
		    <th>IdOrdine</th>
		    <th>Utente</th>
		    <th>Destinazione</th>
		    <th>Email</th>
		    <th>Data</th>
		    <th>Costo
		</tr>
				<%
				if (ordini != null && ordini.size() != 0) {
					Iterator<?> it = ordini.iterator();
					while (it.hasNext()) {
						OrdineBean bean = (OrdineBean) it.next();
				%>
					<tr>
					    <td><%=bean.getIdOrdine()%></td>
					    <td><%=bean.getUtente()%></td>
					    <td><%=bean.getDestinazione()%></td>
					    <td><%=bean.getEmail()%></td>
					    <td><%=bean.getDataOrdine()%></td>
					    <td><%=bean.getCostoTotale()%></td>
					</tr>
				<%
					}
				} else {
					%>
					<p>Nessun Ordine disponibile.</p>
				<%
					}
				%> 
	</table>
	
	<jsp:include page="../footer.jsp"/>


</body>
</html>