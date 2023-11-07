function findOdd(A) {
    let count=0;
    
    for(let i=0; i<=A.length; i++){     
        for(let j=0; j <= A.length; j++){
            if(A[i]==A[j]){
            count++;
            //console.log("counted: ", count);
            }
        }
        if(count%2==1) {
            //console.log("A: ", A[i])
            return A[i];
        }
    }
}