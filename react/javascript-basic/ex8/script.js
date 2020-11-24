var elements = ['taula', 'cadira', 'ordinador', 'libreta']

function calculator(operator, value1, value2) {
    operator = operator.toLowerCase();
    switch (operator) {
        case 'resta':
            return value1 - value2
        case 'suma':
            return value1 + value2
        case 'multiplicacion':
            return value1 * value2
        case 'division':
            return value1 / value2
        default:
            return NaN
    }
}

var result = calculator('resta', 40, 20);

console.log(result)