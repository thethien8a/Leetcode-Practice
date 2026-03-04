"""
https://leetcode.com/problems/string-to-integer-atoi/
"""

# Not optimize
# class Solution:
#     def myAtoi(self, s: str) -> int:
#         res = ""
#         for c in s:
#             if c == " ":
#                 if len(res) == 0:
#                     continue
#                 else:
#                     break
#             elif c == "-" or c == "+":
#                 if len(res) == 0:
#                     res += c
#                 else:
#                     break
#             elif c.isdigit():
#                 res += c
#             else:
#                 break

#         if len(res) == 0:
#             return 0
#         elif res[-1] == "-" or res[-1] == "+":
#             return 0
#         else:
#             res = int(res)  
#             if res > 2 ** 31 - 1:
#                 return 2 ** 31 - 1
#             elif res < -2 ** 31:
#                 return -2 ** 31
#             else:
#                 return res


# Optimize
class Solution:
    def myAtoi(self, s: str) -> int:
        s = s.strip()
        if not s:
            return 0
        
        sign, i, res = 1, 0, 0
        if s[0] == "-":
            sign = -1
            i += 1
        elif s[0] == "+":
            i += 1
        
        while (i < len(s)) and (s[i].isdigit()):
            res = res*10 + int(s[i])

            if res * sign  > 2**31 - 1:
                return 2**31 - 1
            elif res * sign < -2**31:
                return -2**31

            i += 1
        
        return res * sign