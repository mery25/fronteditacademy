var nameArr = ['M', 'A', 'R', 'I', 'A', '8']

function isVocal(letter) {
    return letter == 'A' || letter == 'E' || letter == 'I' 
    || letter == 'O' || letter == 'U'
}

for (letter of nameArr) {
    if (letter >= 0 && letter <= 9) {
        console.log('Els noms de persones no contenen el número: ' + letter)
    } else if (isVocal(letter)) {
        console.log('He trobat la VOCAL: ' + letter)
    } else {
        console.log('He trobat la CONSONTANT: ' + letter)
    }
}

