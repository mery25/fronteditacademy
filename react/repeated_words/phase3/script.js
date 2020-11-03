var nameArr = ['M', 'A', 'R', 'I', 'A', 'T', 'I', 'B', 'A', 'U']

var letterMap = {};
for (var letter of nameArr) {

    if (letterMap[letter]) {
        letterMap[letter] = letterMap[letter] + 1
    } else {
        letterMap[letter] = 1
    }
}

console.log(letterMap)