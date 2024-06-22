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
<title>Header</title>
	<link type="text/css" rel="stylesheet" href="styles/style.css"/>
	<link rel="shortcut icon" href="images/cocoicon2.ico"/> 
 	<link type="text/css" rel="stylesheet" href="styles/paginaprodotti.css"/>
 	<script src="scripts/sidebar.js" type="text/javascript"></script>
	<script src="scripts/cart.js" type="text/javascript"></script>
	<script src="scripts/searchbar.js" type="text/javascript"></script>
</head>
<body>

	<header>
		<div class="TastoMenu" >
			<span style="font-size:30px;cursor:pointer" onclick="openNav()">
				<img src="images/icone/Header/iconamenu.png" alt="open">
			</span>
		</div>
		
		<div class="TastoRicerca" >
			<span style="font-size:30px;cursor:pointer" onclick="openSearch()">
				<img src="images/icone/Header/lenteingrandimento.png" alt="openSearch">
			</span>
		</div>
		
		<div class="ContentHeader">
			<a href="index.jsp" style="cursor: pointer"><img alt="logo RetroCrates" src="images/logofinale.png"></a>
		</div>
		
		
		
		<%
		if(tipoutente != null){
			if(tipoutente.equals("Utente")) { %>
		    <div class="TastoLogin">
				<span style="font-size:30px;cursor:pointer">
					<a href="user/account.jsp"><img src="images/icone/Header/crashIconLogin.png" alt="open"></a>
				</span>
			</div>
		<% } else if(tipoutente.equals("Admin")) { %>
		    <div class="TastoLogin">
					<span style="font-size:30px;cursor:pointer">
						<a href="admin/Admin.jsp"><img src="images/icone/Header/crashIconLogin.png" alt="open"></a>
					</span>
				</div>
		<% }
		}else{
		%>
		<div class="TastoLogin">
			<span style="font-size:30px;cursor:pointer">
				<a href="login.jsp"><img src="images/icone/Header/crashnologin.png" alt="openLog"></a>
			</span>
		</div>
		<% }%>
		<!--	
			
			
			/*
			if(utente.getTipo().equals("Utente")){ */
		%>
				<div class="TastoLogin">
					<span style="font-size:30px;cursor:pointer">
						<a href="account.jsp"><img src="images/fotoprofilodell'utente" alt="open"></a>
					</span>
				</div>
		<% /*}else if(utente.getTipo().equals("Admin")){ */%>
				<div class="TastoLogin">
					<span style="font-size:30px;cursor:pointer">
						<a href="admin/admin.jsp"><img src="images/fotoprofilodell'utente" alt="open"></a>
					</span>
				</div>
		<%
		/*	}
		}else{ */
		%>
			  
				
				
		<div class="TastoLogin">
			<span style="font-size:30px;cursor:pointer">
				<a href="login.jsp"><img src="images/icone/Header/crashIconLogin.png" alt="openLog"></a>
			</span>
		</div>
		
		
		<%/* } */%>
			  -->
		
		<div class="TastoCarrello">
			<span style="font-size:30px;cursor:pointer" onclick="openCart()">
				<img src="images/icone/Header/cart.png" alt="opencart">
			</span>
		</div> 
	</header>

</body>
</html>
