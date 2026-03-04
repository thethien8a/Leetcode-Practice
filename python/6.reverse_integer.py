"""
https://leetcode.com/problems/reverse-integer/
"""

class Solution:
    def reverse(self, x: int) -> int:
        sign = -1 if x < 0 else 1
        x = -x if x < 0 else x

        res = 0
        while x != 0:
            res = res*10 + x%10
            x //= 10
        
        last_result = sign * res
        if last_result > 2 ** 31 - 1 or last_result < -2 ** 31:
            return 0
        
        return last_result