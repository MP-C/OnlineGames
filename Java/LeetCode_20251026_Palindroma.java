class Solution {
    public boolean isPalindrome(String s) {
        // 1. Limpeza e Normalização da String
        // Expressão regular corrigida para incluir dígitos e normalizar tudo
        String simple = s.replaceAll("[^a-zA-Z0-9]", "").toLowerCase();
        
        // 2. O caso de String vazia ou contendo apenas caracteres não alfanuméricos
        // é resolvido aqui, pois 'simple' será uma string vazia ("").
        if (simple.isEmpty()) {return true;}
                
        // 3. Comparação: Criação da string invertida
        String rev = new StringBuilder(simple).reverse().toString();
        
        // 4. Comparação final: Uso correto do método .equals()
        // Compara a string normalizada com a string invertida.
        return simple.equals(rev);
    }
}