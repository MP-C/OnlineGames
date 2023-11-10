function accum(s) {
    const lowerSplit=(s.toLowerCase().split(''));
    let oneLetter =[];
    let stringPush =[];
    
    for(let i=0; i<=lowerSplit.length-1; i++){
        oneLetter=lowerSplit[i].toUpperCase();  
        (stringPush += oneLetter);
        for(let j=0; j<= i-1; j++){
            (stringPush += oneLetter.toLowerCase());
        }
        if(i!=lowerSplit.length-1){
        stringPush +='-';
        };
    }
    return stringPush;
};