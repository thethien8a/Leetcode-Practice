""" 
https://leetcode.com/problems/multiply-strings/
"""

# Not optimize: do exactly what math do
class Solution:
    def multiply(self, num1: str, num2: str) -> str:
        last_idx1 = len(num1) - 1
        res = 0
        hat_num1 = 0

        while(last_idx1 >= 0):
            hat_num2 = 0
            last_idx2 = len(num2) - 1
            while(last_idx2 >= 0):
                res += int(num2[last_idx2]) * (10**hat_num2) * int(num1[last_idx1]) * (10**hat_num1)
                last_idx2 -= 1
                hat_num2 += 1
            hat_num1 += 1
            last_idx1 -= 1
        
        return str(res) 


# Optimize: do by computer
class Solution(object):
    def multiply(self, num1: str, num2: str) -> str:
        n1 = 0
        for i in num1:
            n1 = n1*10 + (ord(i) - 48)

        n2 = 0
        for j in num2:
            n2 = n2*10 + (ord(j) - 48)   
        
        return str(n1*n2)