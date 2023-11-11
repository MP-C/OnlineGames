function solution(digits){
    let final=0;
    for(let i = 0; i<= digits.length; i++){
        let numbers = digits.substr(i, 5);
        if(final<numbers){
            final=Number(numbers);
        }
    }
    return final;
}