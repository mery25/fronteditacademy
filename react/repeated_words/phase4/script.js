var nameArr = ['M', 'A', 'R', 'I', 'A']
var surnameArr = ['T', 'I', 'B', 'A', 'U']

var totalArr = nameArr;
totalArr.push(' ');

for (var letter of surnameArr) {
    totalArr.push(letter)
}

console.log(totalArr)