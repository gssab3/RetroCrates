function checkFile(input) {
    const file = input.files[0];
    const maxSizeMB = 10; // Dimensione massima consentita in MB
    const allowedFormats = ['image/jpeg', 'image/png']; // Formati consentiti

    if (file) {
        if (file.size > maxSizeMB * 1024 * 1024) {
            document.getElementById('fileError').textContent = 'La foto è troppo grande. Dimensione massima: ' + maxSizeMB + ' MB.';
            input.value = ''; // Resetta il campo file
        } else if (!allowedFormats.includes(file.type)) {
            document.getElementById('fileError').textContent = 'Formato non supportato. Scegli un file JPEG o PNG.';
            input.value = ''; // Resetta il campo file
        } else {
            document.getElementById('fileError').textContent = ''; // Rimuovi eventuali messaggi di errore
        }
    }
}