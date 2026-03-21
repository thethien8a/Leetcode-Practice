
"""
https://leetcode.com/problems/jump-game-ii/
"""

from typing import List

# Not optimze: brute-force
class Solution:
    def jump(self, nums: List[int]) -> int:
        min_jump = 10e9
        
        def jump_times(nums, times_jump, cur_idx):
            nonlocal min_jump
            # Nếu cur_idx mà đang lớn hơn chiều dài nums rồi
            if cur_idx >= len(nums):
                return
            # cur_idx mà bằng -> chính là cái ta cần kiểm tra
            if cur_idx == len(nums)-1:
                if times_jump < min_jump:
                    min_jump = times_jump
                return
            
            # Thử mọi trường hợp
            for i in range(1, nums[cur_idx]+1):
                jump_times(nums, times_jump + 1, cur_idx + i)
        
        jump_times(nums, 0, 0)

        return min_jump

# Optimize: greedy
class Solution:
    def jump(self, nums: List[int]) -> int:
        jumps = 0
        current_end = 0
        farthest = 0
        
        for i in range(len(nums) - 1):
            farthest = max(farthest, i + nums[i])
            
            if i == current_end:
                jumps += 1
                current_end = farthest
        
        return jumps