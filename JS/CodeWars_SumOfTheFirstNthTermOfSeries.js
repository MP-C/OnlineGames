function SeriesSum(n) {
    let result=0;
    for (let i=0; i<n; i++){
        const newValue = (1/(1+3*i));
        result = result + newValue;
    }
    return result.toFixed(2);
}