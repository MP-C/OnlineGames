function duplicateEncode(word){
    let count = {};
    let string = []; 
    let result = [];

    for (let i = 0; i < word.length; i++) {
        const letter = word[i].toLowerCase();
        if (!count[letter]) {
            count[letter] = 1;
        } else {
            count[letter]++;
        }
    }
    
    word.toLowerCase().split('').map( el =>{
        if(count[el]==1){
            result.push('(');
        }else{
            result.push(')');
        }
    })
    return (result.join(''));
}