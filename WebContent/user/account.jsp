<%@page import="org.apache.catalina.ha.backend.Sender"%>
<%@page import="rc.model.UtenteBean"%>
<%@page import="rc.model.OrdineBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="rc.model.ProdottoBean,java.util.*, javax.servlet.RequestDispatcher" %>

<%
    HttpSession sessione = request.getSession(true);
    UtenteBean utUtil = (UtenteBean) sessione.getAttribute("currentSessionUser");

    if (utUtil == null) {
        response.sendRedirect(request.getContextPath() + "/index");
        return; // Uscita anticipata per evitare l'esecuzione del codice rimanente
    }

    Collection<?> ordini = (Collection<?>) request.getAttribute("ordini");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport"  content="initial-scale=1, width=device-width">
<title>RetroCrates</title>
 <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/styles/style.css"/>
 <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/styles/Tabelle.css"/>
 <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/styles/user.css"/>
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/cocoicon2.ico"/> 
 	<script src="${pageContext.request.contextPath}/scripts/sidebar.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/scripts/cart.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/scripts/searchbar.js" type="text/javascript"></script>
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
	
	<jsp:include page="../header.jsp"/>
	
	<form id="formRicerca" action="./RicercaProdottoServlet" method="get"> 
    <input id="barraRicerca" name="query" type="text" placeholder="Cerca nel sito">
    <input id="submitRicerca" type="submit" value="Cerca" >
    <input type="hidden" name="input" value="1">
    <input type="hidden" name="TipoProdotto" value="TUTTI">
	</form>

	<div id="risultatiRicerca"></div>
			
			<div class="benvenuto">
			<h1>Bentornato <%=utUtil.getUsername()%> !</h1>
			<h2>Ecco tutti i tuoi ordini</h2>
			</div>
			
		<table class="tabella">
			<tr>
		    	<th>Id Ordine</th>
		    	<th>Destinazione</th>
		    	<th>Costo Totale</th>
		   		<th>Data dell'Ordine</th>
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
					<tr>
						<td colspan="4" style="text-align: center;">Nessun ordine trovato.</td>
					</tr>
				<%
					}
				%> 
			
		</table>
		
	<jsp:include page="../footer.jsp"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/scripts/ricerca.js" type="text/javascript"></script>

</body>
</html>