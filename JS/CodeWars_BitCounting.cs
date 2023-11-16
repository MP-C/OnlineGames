using System;

public class Kata
{
    public static int CountBits(int n)
    {
        int count = 0;
        if(n>0)
        {
            string binary = Convert.ToString(n, 2);
            foreach (char bit in binary)
            {
                if (bit == '1')
                {
                        count++;
                }
            }
        }
        return count;
    }
}