/*
Given two strings s and t, return true if t is an anagram of s, and false otherwise.

Example 1:
Input: s = "anagram", t = "nagaram"
Output: true

Example 2:
Input: s = "rat", t = "car"
Output: false
*/

// Obriga a que não exista nenhum "for"
class Solution {
    public boolean isAnagram(String s, String t) {
        // 1. Condição básica: Se os comprimentos forem diferentes, não pode ser um anagrama.
        if(s.length() != t.length()){return false;}
        
        // 2. Converte as strings para arrays de caracteres.
        char[] sArray = s.toCharArray(); // to transform string into char
        char[] tArray = t.toCharArray();
        
        // 3. Ordena os arrays de caracteres. O método Arrays.sort() não usa um loop 'for' explícito aqui.
        Arrays.sort(sArray); // to order alphabetic every char
        Arrays.sort(tArray);

        // 4. Compara os arrays ordenados. Se forem iguais, são anagramas.
        return Arrays.equals(sArray, tArray);
    }
}