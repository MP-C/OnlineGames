/*
Given two arrays of strings a1 and a2 return a sorted array r in lexicographical order of the strings of a1 which are substrings of strings of a2.
Example 1:
a1 = ["arp", "live", "strong"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
returns ["arp", "live", "strong"]
Example 2:
a1 = ["tarp", "mice", "bull"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
returns []
*/


function inArray(array1,array2){
  let r = [];
  
  for (const subword of array1)
    for(const word of array2)
      word.includes(subword)? r.push(subword) : "";
  return Array.from(new Set(r.sort()));
}