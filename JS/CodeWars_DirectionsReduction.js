function dirReduc(arr){
  // ["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"].
  let path = [];
  let oppsiteDir = {'NORTH':'SOUTH', 'SOUTH':'NORTH','EAST':'WEST','WEST':'EAST'};
  
  for(const direction of arr){
    let lastDir = path[path.length-1];
    if(lastDir === oppsiteDir[direction]){
      path.pop();
    }
    else{
      path.push(direction);
    }
  }
  return path;
}