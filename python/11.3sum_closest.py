""" 
https://leetcode.com/problems/3sum-closest/
"""

from aiohttp_retry import List


class Solution:
    def threeSumClosest(self, nums: List[int], target: int) -> int:
        nums.sort()
        n = len(nums)
        res = 0
        min_left_over = 10e9
        for i in range(n):

            if i > 0 and nums[i] == nums[i-1]:
                continue

            left = i + 1
            right = n - 1
            
            while left < right:
                total = nums[i] + nums[left] + nums[right]

                if abs(total - target) < min_left_over:
                    res = total
                    min_left_over = abs(total - target)

                if total < target:
                    left += 1
                elif total > target:
                    right -= 1
                else:
                    return total

        return res