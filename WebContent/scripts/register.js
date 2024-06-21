function checkEmail(inputtxt) {
    var email = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if(inputtxt.value.match(email)) 
        return true;

    return false;    
}

function checkData(inputtxt) {
    var data = /^\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$/;
    if(inputtxt.value.match(data)) 
        return true;

    return false;    
}

function checkUserName(inputtxt) {
    var userName = /^[A-Za-z0-9]+$/;
    if(inputtxt.value.match(userName)) 
        return true;

    return false;    
}

function checkPassword(inputtxt) {
    var password = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/;
    if(inputtxt.value.match(password)) 
        return true;

    return false;    
}

function validate(obj) {    
    var valid = true;    
    
    var email = document.getElementsByName("email")[0];
    if(!checkEmail(email)) {
        valid = false;
        document.getElementById("errEmail").innerHTML = "email non valida";
        errEmail.style.color = "red";
    } else {
        document.getElementById("errEmail").innerHTML = "";    
    }        
    
    var data = document.getElementsByName("data")[0];
    if(!checkData(data)) {
        valid = false;
        document.getElementById("errNascita").innerHTML = "data non valida";
        errNascita.style.color = "red";
    } else {
        document.getElementById("errNascita").innerHTML = "";
    }        
    
    var user = document.getElementsByName("username")[0];
    if(!checkUserName(user)) {
        valid = false;
        document.getElementById("errUser").innerHTML = "username non valida";
        errUser.style.color = "red";
    } else {
        document.getElementById("errUser").innerHTML = "";
    }        
    
    var pw = document.getElementsByName("password")[0];
    if(!checkPassword(pw)) {
        valid = false;
        document.getElementById("errPass").innerHTML = "password non valida. Introdurre caratteri minuscoli, maiuscoli, numeri e simboli. Minimo 8 caratteri";
        errPass.style.color = "red";
    } else {
        document.getElementById("errPass").innerHTML = "";
    }        
    
    if(valid)
        obj.submit();    
}

function onFocus(x) {
    x.style.background = "grey";
}
