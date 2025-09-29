function findNb(m) {
  let n=-1;
    if(Number.isInteger(Math.sqrt(m)) && m>=2){
       if(Number.isInteger(n=((-1 + Math.sqrt(1+(8*Math.sqrt(m))))/2))) {
         return n;
       }
    }       
    return (-1);
}