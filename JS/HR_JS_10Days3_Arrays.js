/**
*   Return the second largest number in the array.
*   @param {Number[]} nums - An array of numbers.
*   @return {Number} The second largest number in the array.
**/
function getSecondLargest(nums) {
    let order = [...new Set(nums)].sort((a, b) => b - a);
    return order[1];
}