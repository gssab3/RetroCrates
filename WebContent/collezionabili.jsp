<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <meta name="viewport"  content="initial-scale=1, width=device-width">
<title>RetroCrates</title>
 <link type="text/css" rel="stylesheet" href="css/style.css"/>
 <link rel="shortcut icon" href="images/cocoicon2.ico" /> 
 	<script src="js/sidebar.js" type="text/javascript"></script>
	<script src="js/cart.js" type="text/javascript"></script>
</head>
<body>
	<div class="barraNavigazione" id="barraNavigazione"> 
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
		<p>Menu<p>
		<ul id="menu">
			<li id="console"> <a href="console.jsp">Console</a>
			  	<ul>
			  		<%-- Qua ci mettiamo le pagine con la ricerca --%>
					<li id="sony"><a href="console.jsp">Sony</a> </li>
					<li id="microsoft"><a href="console.jsp">Microsoft</a></li>
					<li id="nintendo"><a href="console.jsp">Nintendo</a></li>
					<li id="sega"><a href="console.jsp">Sega</a></li>
					<li id="atari"><a href="console.jsp">Atari</a></li>
					<li id="altre"><a href="console.jsp">Altre</a></li>
				</ul>
			  </li>
			<li id="videogiochi"><a href="videogiochi.jsp">Videogiochi</a>
				<ul>
			  		<%-- Qua ci mettiamo le pagine con la ricerca --%>
					<li id="genere"><a href="videogiochi.jsp">Genere</a>
				</ul>
			</li>
			<li id="collezionabili"><a href="collezionabili.jsp">Collezionabili</a>
			</li>
			<li id="aboutus"><a href="aboutus.html">Chi Siamo</a>
			</li>	
		</ul>
	</div>
	
	
	
	<header>
		<div class="TastoMenu" >
			<span style="font-size:30px;cursor:pointer" onclick="openNav()">
				<img src="images/iconamenu.png" alt="open">
			</span>
		</div>
		<div class="ContentHeader">
			<a href="index.jsp"><img alt="logo RetroCrates" src="images/logotemporaneo.png" width="100px"></a>
			<h1>Collezionabili</h1>
		</div>
	</header>
	
	
	<footer>
		<h1>Buongiorno</h1>
	</footer>
</body>
</html>