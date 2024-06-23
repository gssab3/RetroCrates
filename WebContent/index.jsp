<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="rc.model.ProdottoBean,java.util.*, javax.servlet.RequestDispatcher, java.io.InputStream, rc.model.UtenteBean" %>

<%
	Collection<?> prodotti = (Collection<?>) request.getAttribute("prodotti");
	if(prodotti == null) {
		response.sendRedirect(request.getContextPath()+"/index");	
		return;
	}
	
	HttpSession sessione = request.getSession(true);
	UtenteBean utUtil = (UtenteBean) sessione.getAttribute("currentSessionUser");
	String tipoutente = null;
	if(utUtil != null)
		tipoutente = (String) utUtil.getTipo();
	else
		tipoutente = null;
	
%>

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
	
	<div class = "rigaprodotti" style="margin-top: 20px">
				<%
				if (prodotti != null && prodotti.size() != 0) {
					Iterator<?> it = prodotti.iterator();
					while (it.hasNext()) {
						ProdottoBean bean = (ProdottoBean) it.next();
						Float costo = bean.getCosto();
						String image = null;
						if (bean.getPicture() != null) {
						    InputStream blob = bean.getPicture().getBinaryStream();
						    byte[] data = new byte[(int) bean.getPicture().length()];
						    blob.read(data);
						    image = Base64.getEncoder().encodeToString(data);
						}
						
				%>
				<div class="colonnaprodotto">
					<div class = "immagineprodotto">
						<% if(image!=null){ %>
							<a href="ProdottoServlet?IdProdotto=<%=bean.getIdProdotto()%>"><img src="data:image/png;base64,<%=image%>" alt="ImmagineProdotto" style="width: 200px; height: 225px"></a>
						<%
							}
							else
							{
						%>
							<a href="ProdottoServlet?IdProdotto=<%=bean.getIdProdotto()%>"><img src = "images/productIMG/noimg.png" alt = "ImmagineProdotto" style="width: 200px; height: 225px"></a>
						<%
							}
						%>
					</div>
					<div>
						<p class = "nome"><%=bean.getNome()%></p>
						<p class = "prezzo"><%=costo%>€</p>
					</div>	
						
						
						<%if(tipoutente != null){
							if(tipoutente.equals("Admin")) { %>
			    				<div>
									<span  style="font-size:20px;cursor:pointer">
										<a class="add alli" href="user/account.jsp">Rimuovi Prodotto</a>
									</span>
									
									<span  style="font-size:20px;cursor:pointer">
										<a class="add alli" href="user/account.jsp">Modifica Prodotto</a>
									</span>
								</div>
							<%}
							}%>
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
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="scripts/ricerca.js" type="text/javascript"></script>
	
	<jsp:include page="footer.jsp"/>
	
</body>
</html>
