function openSearch() {
	     var barra = document.getElementById("barraRicerca");
	     var bottone = document.getElementById("submitRicerca")
    if (barra.classList.contains("open")) {
        barra.classList.remove("open");
        bottone.classList.remove("open");
        barra.classList.add("close");
        bottone.classList.add("close");
    } else {
        barra.classList.add("open");
        bottone.classList.add("open");
        barra.classList.remove("close");
        bottone.classList.remove("close");
    }   
}