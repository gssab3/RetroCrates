<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<header>
		<div class="TastoMenu" >
			<span style="font-size:30px;cursor:pointer" onclick="openNav()">
				<img src="images/iconamenu.png" alt="open">
			</span>
		</div>
		
		<div class="TastoRicerca" >
			<span style="font-size:30px;cursor:pointer" onclick="openSearch()">
				<img src="images/lenteicona.png" alt="openSearch">
			</span>
		</div>
		
		<div class="ContentHeader">
			<a href="index.jsp" style="cursor: pointer"><img alt="logo RetroCrates" src="images/logofinale.png"></a>
		</div>
		
		
		<%-- Qui dobbiamo fare un if, che se siamo loggati il tato login reinderizza al profilo e non alla pagina di login --%>
		<div class="TastoLogin">
			<span style="font-size:30px;cursor:pointer">
				<a href="login.jsp"><img src="images/crashIconLogin.png" alt="openLog"></a>
			</span>
		</div>
		
		<%-- 
		<div class="TastoAccount">
			<span style="font-size:30px;cursor:pointer">
				<a href="account.jsp"><img src="images/fotoprofilodell'utente" alt="open"></a>
			</span>
		</div> --%>	
		
		<div class="TastoCarrello">
			<span style="font-size:30px;cursor:pointer" onclick="openCart()">
				<img src="images/cart.png" alt="opencart">
			</span>
		</div> 
	</header>

</body>
</html>