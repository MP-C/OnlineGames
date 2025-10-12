/*
Objective:
Today, we're practicing bitwise operations. Check the attached tutorial for more details.

Task:
We define S to be a sequence of distinct sequential integers from 1 to n; in other words, S={1,2,3,4,...n}.
We want to know the maximum bitwise AND value of any two integers, a and b (where a<b), in sequence S that
is also less than a given integer, k. Complete the function in the editor so that given n and k, it 
returns the maximum .
Note: The & symbol represents the bitwise AND operator.

Input Format:
The first line contains an integer, q, denoting the number of function calls.
Each of the q subsequent lines defines a dataset for a function call in the form of two space-separated
integers describing the respective values of n and k.
 */

function getMaxLessThanK(n, k){
    // Condtions:
    // n is a max in a sequence => N={1,2,3,...n}
    // k is a limiter
    // A<B, A<B<N
    // max(A&B = R) < K

    let maxR = 0;
    let ab = 0;

    for(let A=1; A<n; A++){
        for(let B=A+1; B<=n; B++){
            ab = A&B;
            //console.log("n="+n, "k="+k, A+"&"+B +"= ", A&B);      
            if(ab<k && ab>maxR ){
                maxR = ab;
            }
        }
    }
    return maxR;    
}
