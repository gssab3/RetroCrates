function openSearch() {
	     var barra = document.getElementById("barraRicerca");
    if (barra.classList.contains("open")) {
        barra.classList.remove("open");
        barra.classList.add("close");
    } else {
        barra.classList.add("open");
        barra.classList.remove("close");
    }   
}