function countPositivesSumNegatives(input) {
    if (input===null || input.length <1 ) {
        return [];
        } else {
            let count = 0;
            let sum = 0;

        for(let i = 0; i < input.length; i++){
            if (input[i] > 0){
                count++;
                //console.log(count);
            } else{
                sum += input[i];
                //console.log(sum)
            }
        }
    return [count, sum];
    }
}