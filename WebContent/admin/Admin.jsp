<%@page import="rc.model.UtenteBean"%>
<%@page import="rc.model.OrdineBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="rc.model.ProdottoBean,java.util.*, javax.servlet.RequestDispatcher" %>

<%
	Collection<?> utenti = (Collection<?>) request.getAttribute("utenti");
	if(utenti == null) {
		response.sendRedirect(request.getContextPath()+"/Admin");	
		return;
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
			<li id="aboutus"><a href="aboutus.jsp">Chi Siamo</a>
			</li>	
		</ul>
	</div>

	
	<jsp:include page="../header.jsp"/>
	
	<form id="formRicerca" action="./RicercaProdottoServlet" method="get"> 
    <input id="barraRicerca" name="query" type="text" placeholder="Cerca nel sito">
    <input id="submitRicerca" type="submit" value="Cerca" >
    <input type="hidden" name="input" value="1">
    <input type="hidden" name="TipoProdotto" value="TUTTI">
	</form>

	<div id="risultatiRicerca"></div>
		
		
		<div class="aggiungere">
		
		<a href="AdminServlet?TipoProdotto=Console" class="add">Aggiungi una Console al Catalogo</a>
		<br>
		<a href="AdminServlet?TipoProdotto=Videogioco" class="add">Aggiungi un Videogioco al Catalogo</a>
		<br>
		<a href="AdminServlet?TipoProdotto=Collezionabile" class="add">Aggiungi un Collezionabile al Catalogo</a>
		<br>
		<br>
		<a class="add" href="/RetroCrates/VediOrdini?sort=0&utente=TUTTI&datax=NULL&datay=NULL">Tutti gli Ordini</a>
		</div>
			<br>
			
		<table class="tabella">
		
		<tr>
		    <th>Username</th>
		    <th>Email</th>
		    <th>Password</th>
		    <th>Data di Nascita</th>
		   	<th>Ordini</th>
		</tr>
				<%
				if (utenti != null && utenti.size() != 0) {
					Iterator<?> it = utenti.iterator();
					while (it.hasNext()) {
						UtenteBean bean = (UtenteBean) it.next();
				%>
					<tr>
					    <td><%=bean.getUsername()%></td>
					    <td><%=bean.getEmail()%></td>
					    <td><%=bean.getPasswordHash()%></td>
					    <td><%=bean.getDatanas()%></td>
					    <td><a href="/RetroCrates/VediOrdini?sort=2&utente=<%=bean.getUsername()%>">Dettagli Ordini</a></td>
					</tr>
				<%
					}
				} else {
					%>
					<p>Nessun Utente disponibile.</p>
				<%
					}
				%> 
	</table>
		
	<jsp:include page="../footer.jsp"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/scripts/ricerca.js" type="text/javascript"></script>

</body>
</html>