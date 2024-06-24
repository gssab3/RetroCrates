function checkCardNumber(inputtxt) {
    var cardNumber = /^\d{16}$/;
    if(inputtxt.value.match(cardNumber)) 
        return true;

    return false;    
}

function checkCVV(inputtxt) {
    var cvv = /^\d{3}$/;
    if(inputtxt.value.match(cvv)) 
        return true;

    return false;    
}

function checkCardholderName(inputtxt) {
    var cardholderName = /^[A-Za-z\s]+$/;
    if(inputtxt.value.match(cardholderName)) 
        return true;

    return false;    
}

function checkExpirationDate(inputtxt) {
    var expirationDate = /^(0[1-9]|1[0-2])\/\d{2}$/;
    if(inputtxt.value.match(expirationDate)) 
        return true;

    return false;    
}

function validateCardDetails(obj) {    
    var valid = true;    
    
    var cardNumber = document.getElementsByName("cardNumber")[0];
    if(!checkCardNumber(cardNumber)) {
        valid = false;
        document.getElementById("errCardNumber").innerHTML = "Numero di carta non valido";
        errCardNumber.style.color = "red";
    } else {
        document.getElementById("errCardNumber").innerHTML = "";    
    }        
    
    var cvv = document.getElementsByName("cvv")[0];
    if(!checkCVV(cvv)) {
        valid = false;
        document.getElementById("errCVV").innerHTML = "CVV non valido";
        errCVV.style.color = "red";
    } else {
        document.getElementById("errCVV").innerHTML = "";
    }        
    
    var cardholderName = document.getElementsByName("cardholderName")[0];
    if(!checkCardholderName(cardholderName)) {
        valid = false;
        document.getElementById("errCardholderName").innerHTML = "Nome del titolare non valido";
        errCardholderName.style.color = "red";
    } else {
        document.getElementById("errCardholderName").innerHTML = "";
    }        
    
    var expirationDate = document.getElementsByName("expirationDate")[0];
    if(!checkExpirationDate(expirationDate)) {
        valid = false;
        document.getElementById("errExpirationDate").innerHTML = "Data di scadenza non valida";
        errExpirationDate.style.color = "red";
    } else {
        document.getElementById("errExpirationDate").innerHTML = "";
    }        
    
    if(valid)
        obj.submit();    
}

function onFocus(x) {
    x.style.background = "grey";
}
