/*
Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.
Assume the environment does not allow you to store 64-bit integers (signed or unsigned).

Example 1:
Input: x = 123
Output: 321

Example 2:
Input: x = -123
Output: -321

Example 3:
Input: x = 120
Output: 21 
*/

class Solution {
    public int reverse(int x) {
       int reversed = 0;

        // Loop principal para processar os dígitos de x
        while (x != 0) {
            // 1. Pega o último dígito de x (pop) => 123/10 = 12,3 OU seja modulo = 3 (resto)
            int digit = x % 10;     // digit = 3
            
            // 2. Remove o último dígito de x => 123 /10 = 12 (pois é só int)
            x /= 10;

            // 3. Atualiza o resultado invertido (push)
            // A multiplicação (reversed * 10) e a adição (+ digit) são feitas juntas, 
            // mas a verificação é feita antes da multiplicação para evitar o overflow.
            reversed = reversed * 10 + digit; // => reserved = 0*10+3
            // passa para o numero seguinte, pois X agora é igual a 12, logo => 1,2, em que modulo é 2, e fica 1
        }

        return reversed;
    }
}