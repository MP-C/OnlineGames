/*
1) Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
You may assume that each input would have exactly one solution, and you may not use the same element twice.
You can return the answer in any order.

Example 1:
Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
*/

/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number[]}
 */
var twoSum = function(nums, target) {
    // to save result
    let result= [];
    // to read first nums position
    for(let i=0; i < nums.length; i++){ 
        //console.log(" myNums[i]", nums[i]);
        // to read the after first number position
        for(let j = i + 1; j <= nums.length; j++){
            if(nums[i] + nums[j] === target){
                result.push(i,j);
                return result;
            }
        }
    }
};



/*
2)
Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

An input string is valid if:
Open brackets must be closed by the same type of brackets.
Open brackets must be closed in the correct order.
Every close bracket has a corresponding open bracket of the same type.

Example 1:

Input: s = "()"
Output: true
Example 2:
*/




/*
)

*/


/*
)

*/


