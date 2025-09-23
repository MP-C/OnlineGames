/*
Given the root of a binary tree, invert the tree, and return its root.
Example 1:
    Input: root = [4,2,7,1,3,6,9]
    Output: [4,7,2,9,6,3,1]

Example 2:
    Input: root = [2,1,3]
    Output: [2,3,1]

Example 3:
    Input: root = []
    Output: []

*/

/**
 * Definition for a binary tree node.
 * function TreeNode(val, left, right) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.left = (left===undefined ? null : left)
 *     this.right = (right===undefined ? null : right)
 * }

//const root = {
//  val: 1,
//  left: { val: 2 },
//  right: { val: 3 }
//};


 * @param {TreeNode} root
 * @return {TreeNode}
 */
var invertTree = function(root) {
    // recursive
    // to check if it is not empty
    if(!root) return null;

    // in each lecture inverse the next founded node
    let left = root.left;
    let right = root.right;

    // checking father, children, and so on
    root.right = invertTree(left); // root.right precedent
    root.left = invertTree(right); // root.left precedent => new left
    return root;
}



/**
#include <stdio.h>
int x=123, y=321;

void Troca()
{
    int aux=x;
    x=y;
    y=aux;
}

int main()
{
    Troca();
    printf("x: %d y: %d",x,y);
}
*/


/* Not Working */
var invertTree = function(root) {
    //recursive
    // to check if it is not empty
    if(root === '') return null;

    // checking father, children, and so on
    let left = invertTree(root.left);
    let right = invertTree(root.right);

    // in each lecture inverse the next founded node
    root.left = right;
    root.right = left;

    return root;
}


var invertTree = function(root) {
    //recursive
    const reverseNode = root =>{
        // to check if it is not empty
        if(root == ''){
            return null;
        }

        // checking father, children, and so on
        reverseNode(root.left);
        reverseNode(root.right);

        // in each lecture inverse the next founded node
        let transitionValue = root.left;
        root.left = root.right;
        root.right = transitionValue;

        return root;
    }
}

var invertTree = function(root) {
    // to save values root 
    let pai = [];
    let filhos = [];
    let netos = [];
    let result=[];

    //order
    function sortInvert(array){
        array.sort(function(a, b){
            return b-a;
        })
    }

    // filter
    for(let i=0; i <= root.length; i++){
        if (i === 0) { // father
            pai.push(root[i]);
        } else if (i <= 2) { // children
            filhos.push(root[i]);
        } else if (i < root.length) { // grand-children
            netos.push(root[i]);
        }
    }
    return result.push(pai, sortInvert(filhos), sortInvert(netos));
};
