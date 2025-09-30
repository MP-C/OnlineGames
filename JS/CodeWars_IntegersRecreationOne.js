function listSquared(m, n) {
  const sqre = [];
  if(m>0 || m<=n){
     for (let N = m; N <= n; N++) {
        let sumSquars=0;
        for(let i=1; i*i<=N; i++){
          if(N%i===0){
            sumSquars +=(i*i)

            const complementaryDivisor = N / i;
            if (i !== complementaryDivisor) {
            sumSquars += complementaryDivisor * complementaryDivisor;
          }
        }
      }
      if (Math.sqrt(sumSquars) % 1 === 0) {
        sqre.push([N, sumSquars]);
      }
    }
  }
  return sqre;
}