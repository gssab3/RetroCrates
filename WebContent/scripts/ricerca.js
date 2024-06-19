/**
 * 
 */
function createXMLHttpRequest() {
	var request;
	try {
		request = new XMLHttpRequest();
	} catch (e) {
		try {
			request = new ActiveXObject("Msxml2.XMLHTTP");  
		} catch (e) {
			try {
				request = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e) {
				alert("Il browser non supporta AJAX");
				return null;
			}
		}
	}
	return request;
}

/*
function loadAjaxDoc(url, method, params, cFuction) {
	var request = createXMLHttpRequest();
	if(request){
		request.onreadystatechange = function() {
			if (this.readyState == 4) {
				if (this.status == 200) {
				    cFuction(this); 
				} else {				
					if(this.status == 0){
						alert("Problemi nell'esecuzione della richiesta: nessuna risposta ricevuta nel tempo limite");
					} else {
						alert("Problemi nell'esecuzione della richiesta:\n" + this.statusText);
					}
					return null;
				}
		    }
		};
		
		setTimeout(function () {
        	if (request.readyState < 4) {
            	request.abort();
        	}
    	}, 15000); 
		
		if(method.toLowerCase() == "get"){
			if(params){
				request.open("GET", url + "?" + params, true);
			} else {
				request.open("GET", url, true);
			}
			request.setRequestHeader("Connection", "close");
	        request.send(null);
		} else {
			if(params){
				request.open("POST", url, true);
				request.setRequestHeader("Connection", "close");
				request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	        	request.send(params);
			} else {
				console.log("Usa GET se non ci sono parametri!");
				return null;
			}
		}
	}
} */


$(document).ready(function(){
    $("#barraRicerca").keyup(function(){
        var x = $(this).val();
        if(x != ""){
            $.ajax({
                url: "./RicercaProdottoServlet?input=0",
                type: "get",
                data: {"query": x},
                dataType: "json",
                success: function(data){
                    var risultatiRicerca = $("#risultatiRicerca").empty().show();
                    $.each(data, function(i,item){
                        var itemDiv = $("<div>").addClass('item'+i).append(
                            $("<p>").attr('id', 'name').html('<a href="/RetroCrates/ProdottoServlet?IdProdotto=' + item.IdProdotto + '">' + item.nome + " " + item.costo + "€" + '</a>')
                        );
                        itemDiv.click(function(){
                            $.get("/ProdottoServlet",{"id" : item.IdProdotto}, function(){
                                window.location = "/ProdottoSingolo.jsp";
                            });
                        });
                        risultatiRicerca.append(itemDiv);
                    });
                }
            });
        }else{
            $("#risultatiRicerca").hide();
        };
    });
});








	