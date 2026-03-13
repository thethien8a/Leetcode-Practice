""" 
https://leetcode.com/problems/divide-two-integers/
"""

# Time out limit
class Solution:
    def divide(self, dividend: int, divisor: int) -> int:
        def decide_sign(res, dividend_sign, divisor_sign):
            if dividend_sign < 0 and divisor_sign < 0:
                return res
            elif dividend_sign > 0 and divisor_sign > 0:
                return res
            else:
                return -res

        if dividend == -2**31 and divisor == -1:
            return 2**31-1

        dividend_sign = 1
        divisor_sign = 1
        if dividend < 0:
            dividend_sign = -1
            dividend = -dividend
        if divisor < 0:
            divisor_sign = -1
            divisor = -divisor
        
        if divisor == 1:
            return decide_sign(dividend,dividend_sign,divisor_sign)
        res = 0
        while(dividend >= 0):
            res += 1
            dividend -= divisor
        
        res -= 1
        return decide_sign(res,dividend_sign,divisor_sign)
    
    
# Optimize
class Solution:
    def divide(self, dividend: int, divisor: int) -> int:
        if dividend == divisor:
            return 1
        if dividend == -2**31 and divisor == -1:
            return (2**31) - 1 
        
        if divisor == 1:
            return dividend
        
        sign = -1 if (dividend < 0) ^ (divisor < 0) else 1
        
        n, d = abs(dividend), abs(divisor)
        ans = 0

        while n >= d:
            p = 0
            while n >= (d << p):
                p += 1
            
            p -= 1
            n -= (d << p)
            ans += (1 << p)

        return min(max(sign * ans, -2**31), 2**31 - 1)