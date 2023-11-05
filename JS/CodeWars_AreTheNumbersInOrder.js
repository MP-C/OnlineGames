function inAscOrder(arr) {
    // Code your algorithm here :
    for (let i=0; i<=arr.length; i++) {
      if (arr[i] >= arr[i+1]) {
        return false;
      }
    }
    return true;
  } //return arr.sort((a, b) => a - b) === arr ? true : false;