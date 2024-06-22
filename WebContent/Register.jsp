<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <meta name="viewport"  content="initial-scale=1, width=device-width">
<title>RetroCrates</title>
 <link type="text/css" rel="stylesheet" href="styles/style.css"/>
 <link type="text/css" rel="stylesheet" href="styles/register.css"/>
 <link rel="shortcut icon" href="images/cocoicon2.ico" /> 
 	<script src="scripts/sidebar.js" type="text/javascript"></script>
	<script src="scripts/cart.js" type="text/javascript"></script>
	<script src="scripts/focusregister.js" type="text/javascript"></script>
	<script src="scripts/darivedere.js" type="text/javascript"></script>
</head>
<body style="background-image: none;">
 
	 <div class="squarelogin">
            <div class="contenutologin">
                <img src="images/loginbgtemp.jpg" alt="immaginelogin" class="immaginelogin">

                <form action="Registrazione" class="registerform" method="POST" onsubmit="event.preventDefault(); validate(this)">
                    <div>
                        <h1 class="titoloregister">
                            <span>Benvenuto</span>
                        </h1>
                        <p class="descrizioneregister">
                            Inizia da qui la tua registrazione su RetroCrates
                        </p>
                    </div>
                    
                    <div>
                        <div class="campiregister">
                        <% if(request.getAttribute("errorMessage") != null) { %>
    <p style="color:red;"><%= request.getAttribute("errorMessage") %></p>
<% } %>
                        	<div>
                        		<p id="errUser"></p>
                                <label for="input-email" class="titoloemailpass">Username</label>
                                <input type="text" name="username" placeholder="Enter your Username" class="emailpass" id="username">
                            </div>
                        
                            <div>
                            	<p id="errEmail"></p>
                                <label for="input-email" class="titoloemailpass">Email</label>
                                <input type="email" name="email" placeholder="Enter your email address" class="emailpass" id="email">
                            </div>
                            
                            <div>
                            	<p id="errPass"></p>
                                <label for="input-pass" class="titoloemailpass">Password</label>
    
                                <div class="bloccopass">
                                
                                    <input type="password" name="password" placeholder="Enter your password" class="emailpass" id="password">
                                </div>
                            </div>
                            
                            <div>
                            	<p id="errNascita"></p>
                                <label for="input-email" class="titoloemailpass">Data di Nascita</label>
                                <input type="date" name="data" class="emailpass" id="datanascita">
                            </div>
                            
                            
                        </div>
                    </div>

                    <div>
                        <div class="pulsantiregister">
                            <input type="submit" value="Register" class="reg">

                        </div>
                    </div>
                            <a href="index.jsp">Torna alla Home</a>
                </form>
            </div>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
			<script src="scripts/register.js"></script>
			
			<script>
			
			var errEmail = document.getElementById("errEmail");
			var errNascita = document.getElementById("errNascita");
			var errUser = document.getElementById("errUser");
			var errPass = document.getElementById("errPass");

		$(document).ready(function(){
			$("#username").keyup(function(){
				var x = $("#username").val();
				if(x != ''){
					$.post("./CheckUsername",{"username" : x},function(data){
						if(data == '0'){
							$("#errUser").html("username già in uso").css({"color" : "red"});
						}
						else{
							$("#errUser").html("");
						}
						});
					}
				else{
					$("#errUser").html("");
				}

			});
		});
	
		
		$(document).ready(function(){
			$("#email").keyup(function(){
				var x = $("#email").val();
				if(x != ''){
					$.post("./CheckEmail",{"email" : x},function(data){
						if(data == '0'){
							$("#errEmail").html("email già in uso").css({"color" : "red"});
						}
						else{
							$("#errEmail").html("");
						}
						});
					}
				else{
					$("#errEmail").html("");
				}

			});
		});
	


	</script>
        </div>
	 

</body>
</html>