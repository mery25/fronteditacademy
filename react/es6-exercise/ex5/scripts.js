
const reverseString = (sentence) => 
{
   let arr = [...sentence];
   return arr.reverse().join('');
} 

console.log(reverseString('hola, que tal?'));