""" 
https://leetcode.com/problems/longest-substring-without-repeating-characters/
"""

class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        max_length = left = 0
        our_set = set()
        for right in range(len(s)):
            while s[right] in our_set:
                our_set.remove(s[left])
                left += 1
            
            our_set.add(s[right])
            max_length = max(max_length, right - left + 1)

        return max_length