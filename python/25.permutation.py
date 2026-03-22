"""
https://leetcode.com/problems/permutations/
"""

from typing import List 

class Solution:
    def permute(self, nums: List[int]) -> List[List[int]]:
        result = []
        
        def back_track(temp_list):
            if len(temp_list) == len(nums):
                result.append(temp_list.copy())
                return

            for num in nums:
                if num in temp_list:
                    continue
                temp_list.append(num)
                back_track(temp_list)
                temp_list.pop()

        back_track([])

        return result