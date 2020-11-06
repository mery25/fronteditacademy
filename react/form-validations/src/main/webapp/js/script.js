const EMAIL_REGEX = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$/
const PASSWORD_REGEX= /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/

function isEmailValid(emailValue) {
    if (!emailValue) {
        return false
    }

    if (EMAIL_REGEX.test(emailValue)) {
        return true
    }
    return false
}

function isPasswordValid(passwordValue) {
    if (!passwordValue) {
        return false
    }

    if (PASSWORD_REGEX.test(passwordValue)) {
        return true
    }
    return false
}

function setInvalidValidation(validatedInput, errorMsg) {
    validatedInput.classList.remove("is-valid")
    validatedInput.classList.add("is-invalid")
    validatedInput.nextElementSibling.innerText = errorMsg
}

function setValidValidation(validatedInput) {
    validatedInput.classList.remove("is-invalid")
    validatedInput.classList.add("is-valid")
    validatedInput.nextElementSibling.innerText = ''
}

function validateEmail(emailInput) {
    var emailValue = emailInput.value
    if (!emailValue) {
        setInvalidValidation(emailInput, 'Email is required')
    }
    else if (!isEmailValid(emailInput.value)) {
        setInvalidValidation(emailInput, 'Email must have a valid format')
    } else {
       setValidValidation(emailInput)
    }
}

function validatePassword(passwordInput) {
    var passwordValue = passwordInput.value
    if (!passwordValue) {
        setInvalidValidation(passwordInput, 'Password is required')
    }
    else if (!isPasswordValid(passwordInput.value)) {
        setInvalidValidation(passwordInput, 'Must have at least 8 characters and contain an Uppercase letter a lower case letter and a number')
    } else {
       setValidValidation(passwordInput)
    }
}

function initLoginFormValidation() {
    var emailControl =  document.getElementById("loginEmailInput")
    var passwordControl =  document.getElementById("loginPasswInput")
    $("#loginButton").click(function(event) {
        validateEmail(emailControl)
        validatePassword(passwordControl)

        emailControl.addEventListener("change", function(event) {
            validateEmail(event.target)
        }, false)
    
        emailControl.addEventListener("input", function(event) {
            validateEmail(event.target)
        }, false)

        passwordControl.addEventListener("change", function(event) {
            validatePassword(event.target)
        }, false)
    
        passwordControl.addEventListener("input", function(event) {
            validatePassword(event.target)
        }, false)

    })
}

function initContactFormValidation() {
    var emailControl =  document.getElementById("loginEmailInput")
    var passwordControl =  document.getElementById("loginPasswInput")
    $("#loginButton").click(function(event) {
        validateEmail(emailControl)
        validatePassword(passwordControl)

        emailControl.addEventListener("change", function(event) {
            validateEmail(event.target)
        }, false)
    
        emailControl.addEventListener("input", function(event) {
            validateEmail(event.target)
        }, false)

        passwordControl.addEventListener("change", function(event) {
            validatePassword(event.target)
        }, false)
    
        passwordControl.addEventListener("input", function(event) {
            validatePassword(event.target)
        }, false)

    })
}
}

function initRegisterFormValidation() {
    
}
$(document).ready(function() {
    initLoginFormValidation()
    initContactFormValidation()
    initRegisterFormValidation()

  })