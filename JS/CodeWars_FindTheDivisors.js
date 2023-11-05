function divisors(integer) {
    let div = [];
  
    for(let i = 2; i < integer  ; i++){
      if(integer % i === 0) {
       div.push(i)
     } 
    }
    if (div.length === 0) {
       return `${integer} is prime`
     }
    return div 
  }