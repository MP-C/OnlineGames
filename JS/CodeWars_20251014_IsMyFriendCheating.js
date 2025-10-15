function removeNb (n) {
  // sumAB = sum of all numbers except A and B
  // prodAB == sumAB
  
  let sumAB = (n*(n+1)/2)
  let prodAB = sumAB+1;
  let A=0;
  let B=0;
  const pairs=[];
  
  // Started with i=2 because if i=1, A=0, which is outside the 1..n sequence.
  for(let i=2; i*i<= prodAB; i++){ //  i*i<= prodAB; is better, because it loop only up to the square root of X (O(sqrt(X)))
    if(prodAB % i === 0){
      A=i-1;
      B=(prodAB/i)-1;
      if(A>0 && A<B && B<=n){
        pairs.push([A,B]);
        // If A and B are distinct (A < B), add the symmetric pair [B, A]
        pairs.push([B,A]);
      }
    }
  }
  return pairs.sort((pair1, pair2) => pair1[0] - pair2[0]);
}