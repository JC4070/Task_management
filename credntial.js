
function resetErrors() {
    let errorElements = document.querySelectorAll(".error");
    errorElements.forEach(element => element.remove());

    let errorInputElements = document.querySelectorAll(".error-input");
    errorInputElements.forEach(element => element.classList.remove("error-input"));
}

function validate(event) {
    event.preventDefault(); // Prevent the form from submitting by default

    // Reset error messages and styles
    resetErrors();

    let emailInput = document.getElementById("email");
    let usernameInput = document.getElementById("username");
    let passwordInput = document.getElementById("password");
    let pass2Input = document.getElementById("pass2");

    let isValid = true;

    // Validation
    if (!validateEmail(emailInput.value)) {
        showError(emailInput, "Please enter a valid email address.");
        isValid = false;
    }

    if (usernameInput.value.trim() === "") {
        showError(usernameInput, "Please enter a username.");
        isValid = false;
    } else if (usernameInput.value.length > 30) {
        showError(usernameInput, "Username must be less than 30 characters.");
        isValid = false;
    }

    if (passwordInput.value.length < 3) {
        showError(passwordInput, "Password must be at least 4 characters long.");
        isValid = false;
    }

    if (passwordInput.value !== pass2Input.value) {
        showError(pass2Input, "Passwords do not match.");
        isValid = false;
    }


    if (isValid) {
        event.target.submit();
    }
}

function validateEmail(email) {
    return /^([a-zA-Z\._]+@[a-zA-Z]+\.[a-zA-Z]+)$/.test(email);
}
function showError(element, message) {
    let errorSpan = document.createElement("span");
    errorSpan.classList.add("error");
    errorSpan.textContent = message;
    errorSpan.style.color = "red"; // Set the text color to red
    element.parentNode.appendChild(errorSpan);
    element.classList.add("error-input");
}



document.querySelector("form").addEventListener("submit", validate);
