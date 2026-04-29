"""
https://leetcode.com/problems/search-in-rotated-sorted-array-ii/
"""

from typing import List

# 1. Worst way: tuyến tính trá hình
class Solution:
    def search(self, nums: List[int], target: int) -> bool:
        
        def double_search(nums, target, l, r):

            mid = (l+r)//2

            if nums[mid] == target:
                return True
            
            if l > r:
                return False

            result = double_search(nums, target, mid+1, r) or double_search(nums, target, l, mid-1)
            return result

        return double_search(nums, target, 0, len(nums)-1)

# 2. Better way:
# Linear

# 3. Best:
class Solution:
    def search(self, nums: List[int], target: int) -> bool:
        l, r = 0, len(nums) - 1
        
        while l <= r:
            mid = (l + r) // 2
            
            if nums[mid] == target:
                return True
            
            # Trường hợp khó: không biết bên nào được sắp xếp
            if nums[l] == nums[mid] == nums[r]:
                l += 1
                r -= 1
            # Đoạn bên trái được sắp xếp
            elif nums[l] <= nums[mid]:
                if nums[l] <= target < nums[mid]:
                    r = mid - 1
                else:
                    l = mid + 1
            # Đoạn bên phải được sắp xếp
            else:
                if nums[mid] < target <= nums[r]:
                    l = mid + 1
                else:
                    r = mid - 1
                    
        return False