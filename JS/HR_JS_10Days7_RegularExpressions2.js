/*
Task
Complete the function in the editor below by returning a RegExp object, re , that matches any 
string s satisfying both of the following conditions:

String s starts with the prefix Mr., Mrs., Ms., Dr., or Er.
The remainder of string s (i.e., the rest of the string after the prefix) consists of one or
more upper and/or lowercase English alphabetic letters (i.e., [a-z] and [A-Z]).
Constraints

The length of string s is >=3.
Output Format

The function must return a RegExp object that matches any string S satisfying both of the given conditions.
Sample Input Mr.X
Sample Output true
*/

function regexVar() {
    /*
     * Declare a RegExp object variable named 're'
     * It must match a string that starts with 'Mr.', 'Mrs.', 'Ms.', 'Dr.', or 'Er.', 
     * followed by one or more letters.
     */
    const re = /^(Mr|Mrs|Ms|Dr|Er)\.[a-zA-Z]+$/;
    /*
     * Do not remove the return statement
     */
    return re;
}