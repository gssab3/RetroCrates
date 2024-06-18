/**
 * 
 */

 window.onload = function() {
            var form = document.querySelector(".registerform");

            form.addEventListener("submit", function(event) {
                var username = document.getElementById("username");
                var email = document.getElementById("email");
                var password = document.getElementById("password");
                var birthdate = document.getElementById("birthdate");

                var usernameError = document.getElementById("usernameError");
                var emailError = document.getElementById("emailError");
                var passwordError = document.getElementById("passwordError");
                var birthdateError = document.getElementById("birthdateError");

                if (username.value === "") {
                    usernameError.textContent = "Il campo Username non può essere vuoto.";
                    event.preventDefault();
                } else {
                    usernameError.textContent = "";
                }

                if (email.value === "") {
                    emailError.textContent = "Il campo Email non può essere vuoto.";
                    event.preventDefault();
                } else {
                    emailError.textContent = "";
                }

                if (password.value === "") {
                    passwordError.textContent = "Il campo Password non può essere vuoto.";
                    event.preventDefault();
                } else {
                    passwordError.textContent = "";
                }

                if (birthdate.value === "") {
                    birthdateError.textContent = "Il campo Data di Nascita non può essere vuoto.";
                    event.preventDefault();
                } else {
                    birthdateError.textContent = "";
                }
            });
        };