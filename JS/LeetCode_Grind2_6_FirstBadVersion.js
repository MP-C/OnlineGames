/*
You are a product manager and currently leading a team to develop a new product. Unfortunately, the latest version of your product fails the quality check. Since each version is developed based on the previous version, all the versions after a bad version are also bad.
Suppose you have n versions [1, 2, ..., n] and you want to find out the first bad one, which causes all the following ones to be bad.
You are given an API bool isBadVersion(version) which returns whether version is bad. Implement a function to find the first bad version. You should minimize the number of calls to the API.

Example 1:

Input: n = 5, bad = 4
Output: 4
Explanation:
call isBadVersion(3) -> false
call isBadVersion(5) -> true
call isBadVersion(4) -> true
Then 4 is the first bad version.
Example 2:

Input: n = 1, bad = 1
Output: 1
*/
/**
 * Definition for isBadVersion()
 * 
 * @param {integer} version number
 * @return {boolean} whether the version is bad
 * isBadVersion = function(version) {
 *     ...
 * };
 */

/**
 * @param {function} isBadVersion()
 * @return {function}
 */

var solution = function(isBadVersion) {
    /**
     * @param {integer} n Total versions
     * @return {integer} The first bad version
     */
    return function(n) {
 
    };
};

// NOT WORKING
/* Only to go furtherm and only with one version 
 if this algortime will be updated, it always need to get all info from 
 API before check what version will be the correct answer
*/
var solution = function(isBadVersion) {
    /**
     * @param {integer} n Total versions
     * @return {integer} The first bad version
     */
    return function(n) {
        let previousVersion=1;
        let nextVersion=n;
        if(isBadVersion!=''){
            while(previousVersion <= nextVersion){
                const average = previousVersion + Math.floor((nextVersion - previousVersion)/2);
                if(isBadVersion(average)){
                    nextVersion = average-1;
                }
                else{
                    previousVersion = average+1;
                }
            }
        }
        return previousVersion;
    }
};


/* Only 1 teste OK */
var solution = function(isBadVersion) {
    /**
     * @param {integer} n Total versions
     * @return {integer} The first bad version
     */
    return function(n) {
        let previousVersion=1;
        let nextVersion=n;
        if(isBadVersion!='' && isBadVersion==true){
            while(previousVersion <= nextVersion){
                let version = Math.floor(nextVersion - previousVersion)/2;
                if(isBadVersion(version)){
                    nextVersion = version;
                }
                else{
                    previousVersion = version;
                }
            }
        }
        return previousVersion;
    }
};

/* Passed all testes, but not when submited */
return function(n) {
    let previousVersion=1;
    let nextVersion=n;
    let version =1;
    if(isBadVersion!=''){
        while(previousVersion <= nextVersion){
            version = previousVersion + Math.floor(nextVersion - previousVersion)/2; // => probleme with floor!! all result must be included 
            if(isBadVersion(version)){
                nextVersion = version -1;
            }
            else{
                previousVersion = version +1;
            }
        }
    }
    return previousVersion;
}