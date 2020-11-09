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
    validatedInput.nextElementSibling.nextElementSibling.innerText = errorMsg
}

function setValidValidation(validatedInput) {
    validatedInput.classList.remove("is-invalid")
    validatedInput.classList.add("is-valid")
    validatedInput.nextElementSibling.nextElementSibling.innerText = ''
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

function validateMessage(messageInput) {
    var messageValue = messageInput.value
    if (!messageValue) {
        setInvalidValidation(messageInput, 'Message is required')
    } else {
       setValidValidation(messageInput)
    }
}

function validateRequiredInput(input, inputName) {
    var value = input.value
    if (!value) {
        setInvalidValidation(input, inputName + ' is required')
    } else {
       setValidValidation(input)
    }
}

function validateConfirmedPassword(pwdInput, confirmedPwdInput) {
    var passwordValue = pwdInput.value
    var confirmedPwdValue = confirmedPwdInput.value
    var isValidPwd = false
    if (!passwordValue) {
        setInvalidValidation(pwdInput, 'Password is required')
    }
    else if (!isPasswordValid(pwdInput.value)) {
        setInvalidValidation(pwdInput, 'Must have at least 8 characters and contain an Uppercase letter a lower case letter and a number')
    } else {
        setValidValidation(pwdInput)
        isValidPwd = true
    }
    
    if (!isValidPwd) return

    if (passwordValue !== confirmedPwdValue) {
        setInvalidValidation(confirmedPwdInput, 'Confirmed password doesn\'t match password')
    } else {
        setValidValidation(confirmedPwdInput)
    }
}

function validateAgreement(checkbox) {
    if (!checkbox.checked) {
        setInvalidValidation(checkbox, 'Agree Terms of Service is required')
    } else {
       setValidValidation(checkbox)
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
    var emailControl =  document.getElementById("contactEmailInput")
    var messageControl =  document.getElementById("contactMessageInput")
    
    $("#contactButton").click(function(event) {
        event.preventDefault()
        validateEmail(emailControl)
        validateMessage(messageControl)

        emailControl.addEventListener("change", function(event) {
            validateEmail(event.target)
        }, false)
    
        emailControl.addEventListener("input", function(event) {
            validateEmail(event.target)
        }, false)

        messageControl.addEventListener("change", function(event) {
            validateMessage(event.target)
        }, false)
    
        messageControl.addEventListener("input", function(event) {
            validateMessage(event.target)
        }, false)

    })
}

function isVisible(modalContent) {
    return modalContent.css('display') != 'none';
}

function addInputEventListeners(control, func) {
    control.addEventListener("change", func, false)
    control.addEventListener("input", func, false)
}
function initRegisterFormValidation() {
    var nameControl =  document.getElementById("registerNameInput")
    var emailControl =  document.getElementById("registerEmailInput")
    var passwordControl =  document.getElementById("registerPwdInput")
    var confirmedPwdControl =  document.getElementById("registerConfirmedPwdInput")
    var provinceControl =  document.getElementById("registerProvinceDropdown")
    var agreementControl =  document.getElementById("registerAgreementChk")

    $("#registerButton").click(function(event) {
        event.preventDefault()
        validateRequiredInput(nameControl, 'Name')
        validateEmail(emailControl)
        validateConfirmedPassword(passwordControl, confirmedPwdControl)
        validateRequiredInput(provinceControl, 'Province')
        validateAgreement(agreementControl)

        addInputEventListeners(nameControl, function(event) {
            validateRequiredInput(event.target)
        })

        addInputEventListeners(emailControl, function(event) {
            validateEmail(event.target)
        })

        addInputEventListeners(passwordControl, function(event) {
            validateConfirmedPassword(event.target, confirmedPwdControl)
        })

        addInputEventListeners(confirmedPwdControl, function(event) {
            validateConfirmedPassword(passwordControl, event.target)
        })
 
        addInputEventListeners(provinceControl, function(event) {
            validateRequiredInput(event.target, 'Province')
        })

        addInputEventListeners(agreementControl, function(event) {
            validateAgreement(event.target)
        })

    })
}

$(document).ready(function() {
    $('#loginModal').on('shown.bs.modal', function () {
        var registerModalContent = $('#registerModalContent')
        var loginModalContent = $('#loginModalContent')

        if (isVisible(loginModalContent)) {
            $('#loginEmailInput').trigger('focus')
        } else {
            $('#registerNameInput').trigger('focus')
        }
        
        
    })
    $("#registerLink").click(function(event) {
        $("#loginModalContent").hide()
        $("#registerModalContent").css("display", "flex")
        $('#registerNameInput').trigger('focus')
    })
    $("#loginLink").click(function(event) {
        $("#registerModalContent").hide()
        $("#loginModalContent").css("display", "flex")
        $('#loginEmailInput').trigger('focus')
    })

    initLoginFormValidation()
    initContactFormValidation()
    initRegisterFormValidation()

  })