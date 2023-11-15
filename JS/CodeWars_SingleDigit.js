function singleDigit(n) {
    /*
    let bin = [Number(n.toString(2))];
        let res = 0;

        for (let i = 0; i <= bin.length; i++){
        res += bin[i];
        console.log(bin[i]);
    }
    .forEach(value => {
        res += value;
    })
    */
    if (n <= 9){
        return n;    
    }
    return singleDigit(n.toString(2).split('').map(Number).reduce((accumulator, value) => accumulator += value));
}