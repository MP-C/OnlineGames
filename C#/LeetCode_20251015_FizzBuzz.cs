public class Solution {
    public IList<string> FizzBuzz(int n) {
        IList<string> output = new List<string>();
        for(int i=1; i<=n; i++){
            string result ="";
            if(i%3==0){
                result +=("Fizz");
            }
            if(i%5==0){
                result +=("Buzz");
            }
            if(i%3!=0 && i%5!=0){
                result = (i.ToString());
            }
            output.Add(result);
        }    
    return output; 
    }
}