function apriMenu() {
		const ismenu = document.querySelector("[isOpenMenu]");
		const sidebar = document.querySelector(".sidebar");
		const overlay = document.querySelector(".overlay");
		const chiudi = document.querySelector(".headersidebar .closeicon");
		
		ismenu.addEventListener("click",(e) => {
			console.log("prova");
			if(sidebar.classList.contains("show")){
				sidebar.classList.remove("show");
				sidebar.classList.add("hidden");
			}
			else
			{
				sidebar.classList.remove("hidden");
				sidebar.classList.add("show");
				
			}
		});
		
		overlay.addEventListener("click",(e) => {
			console.log("over");
			sidebar.classList.remove("show");
			sidebar.classList.add("hidden");
		});
		
		chiudi.addEventListener("click",(e) => {
			console.log("close");
			sidebar.classList.remove("show");
			sidebar.classList.add("hidden");
		});
	}
	
	apriMenu();