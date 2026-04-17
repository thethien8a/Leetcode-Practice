"""
https://leetcode.com/problems/subsets/ 
"""
from typing import List

class Solution:
    def subsets(self, nums: List[int]) -> List[List[int]]:
        result = [[]]
        length_arr = len(nums)

        def recursive_func(start, tmp_res):

            for i in range(start, length_arr):
                tmp_res.append(nums[i])
                result.append(tmp_res[:])

                if i == length_arr - 1:
                    break
                
                recursive_func(i+1, tmp_res.copy())

                tmp_res.pop()

        recursive_func(0, [])       
         
        return result