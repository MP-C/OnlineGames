function cookingTime(eggs) {
    //both solutions are the same...the test don't accept
    // 1.
    let time = 0;
    if(eggs == 0){
        return time;
    }else {
        for(let i=1; i<=eggs; i++){
            let count = i*8;
            if(count >= eggs){
            time = (5 * (i-1)+5);
            return time;
            break;
            }
        }
    }
    //or 2.
    //return 5* Math.ceil(eggs/8);
};