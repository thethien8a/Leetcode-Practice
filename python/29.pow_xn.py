"""
https://leetcode.com/problems/powx-n/ 
"""
from typing import List

# Not optimize:bruite force
class Solution:
    def maxSubArray(self, nums: List[int]) -> int:

        i = 0
        max_sum = -1e5
        while (i < len(nums)):
            temp_res = [nums[i]]
            if max_sum < temp_res[0]:
                max_sum = temp_res[0]
            j = i+1
            while (j < len(nums)):
                temp_res.append(nums[j])
                if max_sum  < sum(temp_res):
                    max_sum = sum(temp_res)
                j += 1
            i += 1
        
        return max_sum
    
    
    # Optimize
    class Solution:
        def maxSubArray(self, nums: List[int]) -> int:            
            res = nums[0]
            total = 0

            for n in nums:
                if total < 0:
                    total = 0

                total += n
                res = max(res, total)
            
            return res