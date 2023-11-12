function isPalindrome(x) {
    const string=x.toLowerCase();
    const reverseString=string.split("").reverse().join("");
    return reverseString === string;
}