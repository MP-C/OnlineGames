function sqInRect(lng, wdth){
  // logic: loop=> 0 => [max(L,W)-min(L,W), S] <=> (L || W) !=0? push(S) : break;
  
  if(lng === wdth){
    return null;
  }
  
  const result=[];
  while(lng !== wdth && lng>0 && wdth>0){
    if(lng> wdth){
      lng = lng - wdth;
      result.push(wdth);
    }else{
      wdth = wdth-lng;
      result.push(lng);
    }
  }
  if(lng > 0) {
    result.push(lng);
  }
  return result;
}