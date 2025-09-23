/*
Given an array of integers nums which is sorted in ascending order, and an integer target,
write a function to search target in nums. If target exists, then return its index. Otherwise, return -1.
You must write an algorithm with O(log n) runtime complexity.
Example 1:

Input: nums = [-1,0,3,5,9,12], target = 9
Output: 4
Explanation: 9 exists in nums and its index is 4
Example 2:

Input: nums = [-1,0,3,5,9,12], target = 2
Output: -1
Explanation: 2 does not exist in nums so return -1
*/

var search = function(nums, target) {
    if(nums.includes(target)){
        return nums.indexOf(target);
    }else{
        return -1;
    }
};

/* Second solution doesn't work on this solution, even if it is a Binary Search Algorithm. Why? */
var search = function(nums, target) {
    let previous = 0;
    let next = nums.length - 1;
        while (previous <= next) {
            let midPosition = Math.ceil((next + previous) / 2);
            if (nums[midPosition] == target){
                return midPosition;
            }
            else if (nums[midPosition] < target){
                previous = midPosition + 1;
            }
            else{
                next = midPosition - 1;
            }
        }
    return -1;
};
