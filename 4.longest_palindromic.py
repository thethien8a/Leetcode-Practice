"""
https://leetcode.com/problems/longest-palindromic-substring/
"""

# class Solution:
#     def longestPalindrome(self, s: str) -> str:
#         def is_palindrome(s, left, right):
#             while (left <= right):
#                 if s[left] == s[right]:
#                     continue
#                 else:
#                     break
#                 left += 1
#                 right -= 1
#             if left <= right:
#                 return False
#             else:
#                 return True
        
#         max_len = 0
#         res = ""
#         for left in range(len(s)):
#             right = len(s) - 1
#             while(left < right):
#                 if s[left] == s[right]:
#                     if is_palindrome(s, left, right):
#                         if max_len < right-left+1:
#                             max_len = right-left+1
#                             res = s[left:right+1]
#                 right -= 1
        
#         return res

class Solution:
    def longestPalindrome(self, s: str) -> str:
        def check(i, j):
            left = i
            right = j - 1

            while left < right:
                if s[left] != s[right]:
                    return False

                left += 1
                right -= 1

            return True

        for length in range(len(s), 0, -1):
            for start in range(len(s) - length + 1):
                if check(start, start + length):
                    return s[start : start + length]

        return ""