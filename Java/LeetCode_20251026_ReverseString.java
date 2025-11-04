/*
Write a function that reverses a string. The input string is given as an array of characters s.
You must do this by modifying the input array in-place with O(1) extra memory.

Example 1:
Input: s = ["h","e","l","l","o"]
Output: ["o","l","l","e","h"]

Example 2:
Input: s = ["H","a","n","n","a","h"]
Output: ["h","a","n","n","a","H"]
*/

// Obriga a que não exista nenhum "for"
class Solution {
public void reverseString(char[] s) {
        // Inicializa o ponteiro da esquerda no início do array.
        int inicio = 0;
        // Inicializa o ponteiro da direita no final do array.
        int fim = s.length - 1;
        // CORREÇÃO SINTÁTICA: 's.length' para arrays! 's.lenght()' para objectos!

        // Continua o loop enquanto o ponteiro da esquerda for menor que o da direita.
        while (inicio < fim) { // A LÓGICA CORRETA É A TROCA (SWAP):
            // 1. Armazena o caractere da esquerda em uma variável temporária.
            char temp = s[inicio];

            // 2. Move o caractere da direita para a posição da esquerda.
            s[inicio] = s[fim];

            // 3. Move o caractere original da esquerda (salvo em 'temp') para a posição da direita.
            s[fim] = temp;

            // 4. Move os ponteiros para o centro do array.
            inicio++;
            fim--;
        }
        // Não pode devolver "return rev;" pois viola o criterio pedido O(1)
    }
}