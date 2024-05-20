function openSearch() {
	     var barra = document.getElementById("barraRicerca");
    if (barra.classList.contains("open")) {
        barra.classList.remove("open");
        barra.style.display = "none";
    } else {
        barra.classList.add("open");
        barra.style.display = "block";
    }   
}