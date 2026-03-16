"""
https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/
"""

# May be not optimize
from aiohttp_retry import List

class Solution:
    def searchRange(self, nums: List[int], target: int) -> List[int]:
        length_nums = len(nums)
        l = 0
        r = length_nums - 1
        while(l <= r):
            mid = (l+r) // 2
            if nums[mid] == target:
                left_mid = mid - 1
                right_mid = mid + 1
                while(left_mid >= 0 and nums[left_mid] == nums[mid]):
                    left_mid -= 1
                while(right_mid <= length_nums - 1 and nums[right_mid] == nums[mid]):
                    right_mid += 1
                left_mid += 1
                right_mid -= 1
                return [left_mid, right_mid]
            
            if nums[mid] < target:
                l = mid + 1
            else:
                r = mid - 1

        return [-1,-1]
    

# Optimize: very good
class Solution:
    def searchRange(self, nums: List[int], target: int) -> List[int]:
        def find_left(nums, target) -> int:
            l, r = 0, len(nums) - 1
            left_pos = -1
            while l <= r:
                mid = (l + r) // 2
                if nums[mid] == target:
                    left_pos = mid  # Ghi nhận, nhưng tiếp tục tìm trái hơn
                    r = mid - 1
                elif nums[mid] < target:
                    l = mid + 1
                else:
                    r = mid - 1
            return left_pos

        def find_right(nums, target) -> int:
            l, r = 0, len(nums) - 1
            right_pos = -1
            while l <= r:
                mid = (l + r) // 2
                if nums[mid] == target:
                    right_pos = mid  # Ghi nhận, nhưng tiếp tục tìm phải hơn
                    l = mid + 1
                elif nums[mid] < target:
                    l = mid + 1
                else:
                    r = mid - 1
            return right_pos

        return [find_left(nums, target), find_right(nums, target)]