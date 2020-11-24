var epic = ['a', 'long', 'time', 'ago', 'in a', 'galaxy', 'far far', 'away'];

var epicResult = epic.reduce((accumulator, currentValue) => accumulator + ' ' + currentValue);
console.log(epicResult);