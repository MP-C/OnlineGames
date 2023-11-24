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



// Full cover cases
var isValid = function(s) {
    // to garantee if there are so many open and close parenthesis, as pairs beteween each other
    if(s.length%2 == 0 ){
        
        // to pair the parentheses
        let parentheses = {
            '(':')',
            '{':'}',
            '[':']'
        }
        // to save any parenthesis
        let stack=[];

        for (let i = 0; i < s.length; i++) {

            // if is a open one
            if(s[i] == "(" || s[i] == "[" || s[i] == "{"){
                stack.push(s[i]);
            }
            else{
            // if is a close one
            //if(s[i] == ")" && stack[i-1] =="(" ||
            //    s[i] == "]" && stack[i-1] =="[" ||
            //    s[i] == "}" && stack[i-1] =="{"){
            //stack.pop(stack.lenght-1);
                let poped = stack.pop(s[i])
                if(parentheses[poped]!=s[i]) {
                    return false;
                }   
            }
        }
        return stack.length ? false : true; 
    }
    else{
        return false;
    }
};






/**
 * @param {string} s
 * @return {boolean}
 */
var isValid = function (s) {
    // to garantee if there are so many open and close parenthesis, as pairs beteween each other
    if(s.length%2 == 0 ){
        // to save any parenthesis
        let stack=[];
        for (let i = 0; i < s.length; i++) {
            let char = stack[stack.lenght-1];
            console.log("char",char);
            // if is a open one
            if(s[i] == "(" || s[i] == "[" || s[i] == "{"){
                stack.push(s[i]);
            }
            // if is a close one
            if(s[i] == ")" && stack[i-1] =="(" ||
                s[i] == "]" && stack[i-1] =="[" ||
                s[i] == "}" && stack[i-1] =="{"){
                    const last = stack.pop();
                stack.pop(stack.lenght-1); 
            }
        }
        return true;
    }
    else{
        return false;
    }
};



//Only cover 2 scenarios: Case 1, and Case 3
/**
 * @param {string} s
 * @return {boolean}
 */
var isValid = function (s) {
    for (let i = 0; i < s.length; i++) {
        if (i % 2 == 0) {
            console.log(s[i]);
            if (s[i] == "(" && s[i + 1] == ")") {
              continue;  
            } else {
                return false;
            } 
            
            if (s[i] == "[" && s[i + 1] == "]") {
              continue;  
            } else{
                return false;
            }

            if (s[i] == "{" && s[i + 1] == "}"){
              continue;  
            } else{
                return false;
            }
        } else {
           if (s[i] == ")" && s[i - 1] == "(") {
              continue;  
            } else{
                return false;
            }

            if (s[i] == "]" && s[i - 1] == "["){
              continue;  
            } else {
                return false;
            }
            
            if (s[i] == "}" && s[i - 1] == "{"){
              continue;  
            } else {
                return false;
            }
        }
    }
    return true;
};
