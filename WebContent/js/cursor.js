/**
 * 
 */

 $(function(){
    $(document).mousemove(function(e){
        var isPointer = $(e.target).parents().addBack().is(function(){
            return $(this).css("cursor") === "pointer";
        });

        $(".cursor").show().css({
            "left": e.clientX + "px",
            "top": e.clientY + "px"
        }).toggleClass("pointer", isPointer);
    }).mouseout(function(){
        $(".cursor").hide();
    });
});

	
	
	