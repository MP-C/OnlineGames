/***************************** */
'use strict';

process.stdin.resume();
process.stdin.setEncoding('utf-8');

let inputString = '';
let currentLine = 0;

process.stdin.on('data', inputStdin => {
    inputString += inputStdin;
});

process.stdin.on('end', _ => {
    inputString = inputString.trim().split('\n').map(string => {
        return string.trim();
    });
    
    main();    
});
function readLine() {
    return inputString[currentLine++];
}
/***************************** */

/*
 * Complete the vowelsAndConsonants function.
 * Print your output using 'console.log()'.
 */
function vowelsAndConsonants(s) {
    let vowels = new Set("aeiou");
    let consonants = [];
    
    for(const char of s){
        if(vowels.has(char)){
            console.log(char);
        }else{
            consonants.push(char)
        }
    }
    for(const consonant of consonants){
        console.log(consonant);
    }
}


function main() {
    const s = readLine();
    
    vowelsAndConsonants(s);
}