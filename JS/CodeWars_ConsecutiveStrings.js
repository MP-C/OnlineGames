function longestConsec(strarr, k) {
  // Edge case: handle invalid inputs
  if (k <= 0 || k > strarr.length) {
    return "";
  }
  
  let longestString = "";
  
  // Iterate through the array to find all consecutive combinations
  for (let i = 0; i <= strarr.length - k; i++) {
    const currentString = strarr.slice(i, i + k).join("");
    
    // Compare and save the first longest string
    if (currentString.length > longestString.length) {
      longestString = currentString;
    }
  }  
  return longestString;
}