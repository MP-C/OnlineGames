function race(v1, v2, g) {
  if(v2>v1){
    let totalSeconds = g/Math.abs(v1-v2)*3600;
    let h = Math.floor(totalSeconds/3600);
    let m = Math.floor((totalSeconds % 3600) / 60);
    let s = Math.floor(totalSeconds % 60);
    return [h,m,s];
  }
  return null;
}