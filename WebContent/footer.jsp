<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<p class="email-id" style="cursor:pointer;"><a href="mailto:s.davanzo5@studenti.unisa.it" style="text-decoration: none; color: #297feb" >s.davanzo5@studenti.unisa.it</a></p>
					<p class="email-id" style="cursor:pointer;"><a href="mailto:g.sabetta3@studenti.unisa.it" style="text-decoration: none; color: #297feb" >g.sabetta3@studenti.unisa.it</a></p>
					<h4>+0512 118 330</h4>
					<h4>+0512 117 895</h4>
					<!--   -->
					
				</div>
				
				<div class="colonnafooter">
					<h3>Naviga</h3>
					<ul>
						<li><a href="index.jsp" style="text-decoration: none; color: #297feb">Home</a>
						<li><a href="#" style="text-decoration: none; color: #297feb">Account</a>
						<li><a href="giocomagico.jsp" style="text-decoration: none; color: #297feb">Ti senti Fortunato?</a>
					</ul>
				</div>
			</div>
			
			<hr>
			<p class="copyright"> RetroCrates Inc. &copy; - All Rights Reserved</p>
	</footer>

</body>
</html>