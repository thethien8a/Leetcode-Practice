"""
https://leetcode.com/problems/container-with-most-water/
"""

# Not optimize
# class Solution:
#     def maxArea(self, height: List[int]) -> int:
#         max_s = 0
#         for i in range(len(height)):
#             j = len(height) - 1
#             while (i < j):
#                 temp = (j-i)*min(height[i], height[j]) 
#                 if temp > max_s:
#                     max_s = temp
#                 j -= 1
#         return max_s
from typing import List

class Solution:
    def maxArea(self, height: List[int]) -> int:
        max_area = 0
        left = 0
        right = len(height) - 1

        while left < right:
            max_area = max(max_area, (right - left) * min(height[left], height[right]))

            if height[left] < height[right]:
                left += 1
            else:
                right -= 1
        
        return max_area