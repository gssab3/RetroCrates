<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <meta name="viewport"  content="initial-scale=1, width=device-width">
<title>RetroCrates</title>
 <link type="text/css" rel="stylesheet" href="styles/style.css"/>
 <link rel="shortcut icon" href="images/cocoicon2.ico" /> 
 	<script src="scripts/sidebar.js" type="text/javascript"></script>
	<script src="scripts/cart.js" type="text/javascript"></script>
	<script src="scripts/focuslogin.js" type="text/javascript"></script>
</head>
<body>
 
	 <div class="squarelogin">
            <div class="contenutologin">
                <img src="images/loginbgtemp.jpg" alt="immaginelogin" class="immaginelogin">

                <form action="" class="loginform">
                    <div>
                        <h1 class="titolologin">
                            <span>Bentornato</span>
                        </h1>
                        <p class="descrizionelogin">
                            Effettua il Login per accedere alla tua area riservata
                        </p>
                    </div>
                    
                    <div>
                        <div class="campilogin">
                            <div>
                                <label for="input-email" class="titoloemailpass">Email</label>
                                <input type="email" placeholder="Enter your email address" required class="emailpass" id="email">
                            </div>
    
                            <div>
                                <label for="input-pass" class="titoloemailpass">Password</label>
    
                                <div class="bloccopass">
                                    <input type="password" placeholder="Enter your password" required class="emailpass" id="password">
                                   <%-- <i class="ri-eye-off-line login__eye" id="input-icon"></i>  da vedere bene come fare
                                   è il pulsante per oscurare la password --%>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div>
                        <div class="pulsantilogin">
                            <input type="submit" value="Log In" class="logreg">
                            <input type="button" value="Sign Up" class="logreg" onclick="location.href='Register.jsp';">
                        </div>
                    </div>
                            <a href="index.jsp">Torna alla Home</a>
                </form>
            </div>
        </div>
	 

</body>
</html>