<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RetroCrates</title>
<link type="text/css" rel="stylesheet" href="css/style.css"/>
<link rel="shortcut icon" href="images/cocoicon2.ico" /> 
</head>
<body>
	<div class="barraNavigazione">
		<ul>
	  		<li> <a href="console.jsp">Console</a>
	  			<UL>
	  				<%-- Qua ci mettiamo le pagine con la ricerca --%>
					<LI><a href="console.jsp">Sony</a>
					<LI><a href="console.jsp">Microsoft</a>
					<LI><a href="console.jsp">Nintendo</a>
					<LI><a href="console.jsp">Altre</a>
				</UL>
	  		</li>
	  		<li><a href="videogiochi.jsp">Videogiochi</a>
				<UL>
		  		<%-- Qua ci mettiamo le pagine con la ricerca --%>
					<LI><a href="videogiochi.jsp">Genere</a>
				</UL>
			</li>
			<li><a href="collezionabili.jsp">Collezionabili</a>
			</li>
			<li><a href="aboutus.html">Chi Siamo</a>
			</li>	
		</ul>
	</div>
	
	<header>
		<div class="ContentHeader">
			<a href="index.jsp"><img alt="logo RetroCrates" src="images/logotemporaneo.png" width="200px"></a>
			<h1>Collezionabili</h1>
		</div>
	</header>
</body>
</html>