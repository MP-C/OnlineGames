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
/*
 * Create the function factorial here
 */
function factorial(n){
    if(n>0 && n<=10){
        for(let i=n-1; i>=1; i--){        
            n = n * i;
        }
    }
    return n;
}

function main() {
    const n = +(readLine());
    
    console.log(factorial(n));
}