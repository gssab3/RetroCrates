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








	