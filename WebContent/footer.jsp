<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="rc.model.UtenteBean,java.util.*, javax.servlet.RequestDispatcher" %>

<%@ page import="javax.servlet.http.HttpSession" %>
    
<%
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
<title>footer</title>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/styles/style.css"/>
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/cocoicon2.ico"/> 
 	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/styles/paginaprodotti.css"/>
 	<script src="${pageContext.request.contextPath}/scripts/sidebar.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/scripts/cart.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/scripts/searchbar.js" type="text/javascript"></script>
</head>
<body>

<footer>
		<div class="rigafooter">
			
				<div class="colonnafooter">
					<img src="${pageContext.request.contextPath}/images/logofinale.png" class="logofooter">
					<p class="azienda">RetroCrates Inc.</p>
				</div>
				
				<div class="colonnafooter">
					<h3>About Us</h3>
					<p>RetroCrates è un sito che punta a riportare in vita la magia dei videogiochi retrò. 
					Offriamo una vasta selezione di titoli classici, divenuti ormai capolavori 
					dimenticati, ma non solo.
					RetroCrates, il tuo portale per l’era d’oro dei videogiochi. </p>
					<p class="email-id" style="cursor:pointer;"><a href="mailto:s.davanzo5@studenti.unisa.it" style="text-decoration: none; color: #4a1f04" >s.davanzo5@studenti.unisa.it</a></p>
					<p class="email-id" style="cursor:pointer;"><a href="mailto:g.sabetta3@studenti.unisa.it" style="text-decoration: none; color: #4a1f04" >g.sabetta3@studenti.unisa.it</a></p>
					<h4>+0512 118 330</h4>
					<h4>+0512 117 895</h4>
					<!--   -->
					
				</div>
				
				<div class="colonnafooter">
					<h3>Naviga</h3>
					<ul>
						<li><a href="${pageContext.request.contextPath}/index.jsp" style="text-decoration: none; color: #4a1f04">Home</a>
						<%
						if(tipoutente != null){
							if(tipoutente.equals("Utente")) { %>
						    <li><a href="account.jsp" style="text-decoration: none; color: #4a1f04">Account</a>
						<% } else if(tipoutente.equals("Admin")) { %>
						    <li><a href="admin/Admin.jsp" style="text-decoration: none; color: #4a1f04">Account</a>
						<% }
						}else{ }%>
						<li><a href="${pageContext.request.contextPath}/giocomagico.jsp" style="text-decoration: none; color: #4a1f04">Ti senti Fortunato?</a>
					</ul>
				</div>
			</div>
			
			<hr>
			<p class="copyright"> RetroCrates Inc. &copy; - All Rights Reserved</p>
	</footer>

</body>
</html>