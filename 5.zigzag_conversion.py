"""
https://leetcode.com/problems/zigzag-conversion/
"""

class Solution:
    def convert(self, s: str, numRows: int) -> str:
        res = ""
        if numRows == 1:
            return s
        for i in range(numRows):
            temp = i
            if (i == 0) | (i == numRows-1):
                while (temp < len(s)):
                    res += s[temp]
                    temp += 2*numRows-2
            else:
                times = 0
                while (temp < len(s)):
                    res += s[temp]
                    if times % 2 == 0:
                        temp += (numRows-2-i)*2+2
                    else:
                        temp += (i-1)*2+2
                    times += 1
        return res