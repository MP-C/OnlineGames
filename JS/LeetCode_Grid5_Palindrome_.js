/**
 * @param {string} s
 * @return {boolean}
 */
var isPalindrome = function(s) {
    var sLower = s.toLowerCase().replace(/[^a-z0-9]/g,'');
    return sLower === sLower.split('').reverse().join('');
};