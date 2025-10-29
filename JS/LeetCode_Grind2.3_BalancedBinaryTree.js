/*
Given a binary tree, determine if it is 
height-balanced


Example 1:
    Input: root = [3,9,20,null,null,15,7]
    Output: true

Example 2:
    Input: root = [1,2,2,3,3,null,null,4,4]
    Output: false

    Example 3:
    Input: root = []
    Output: true

*/



/**
 * Definition for a binary tree node.
 * function TreeNode(val, left, right) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.left = (left===undefined ? null : left)
 *     this.right = (right===undefined ? null : right)
 * }
 */
/**
 * @param {TreeNode} root
 * @return {boolean}
 */
var isBalanced = function(root) {
    // to check if it is not empty
    if(!root) return true;

    // in each lecture inverse the next founded node
    if(root.right === (root.left+1) ||
        root.right === (root.left-1)||
        root.left === (root.right+1)||
        root.left === (root.right-1)||
        root.left === root.right){
        return false;
    } else{
        return true;
    }
};



/* Not Working */
var isBalanced = function(root) {
    // to check if it is not empty
    if(!root){
        // in each lecture inverse the next founded node
        if(root.right === (root.left+1) ||
            root.right === (root.left-1)||
            root.left === (root.right+1)||
            root.left === (root.right-1)||
            root.left === root.right){
            return false;
        } else{
            return true;
        }
    }
};


var isBalanced = function(root) {
    // to check if it is not empty
    if(root){
        // in each lecture inverse the next founded node
        if(root.right === (root.left+1) ||
            root.right === (root.left-1)||
            root.left === (root.right+1)||
            root.left === (root.right-1)||
            root.left === root.right){
            return false;
        }
        return true;
    }
    return false;
};