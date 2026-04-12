"""
https://leetcode.com/problems/search-a-2d-matrix/
"""

from typing import List

# May be not optimize
class Solution:
    def searchMatrix(self, matrix: List[List[int]], target: int) -> bool:
        
        def is_appear(arr, target):
            left_idx = 0
            right_idx = len(arr)-1

            while(left_idx <= right_idx):
                mid = (left_idx + right_idx) // 2

                if arr[mid] == target:
                    return True
                
                if arr[mid] < target:
                    left_idx = mid+1
                else:
                    right_idx = mid-1

            return False

        for arr in matrix:
            if arr[0] <= target <= arr[-1]:
                if is_appear(arr, target):
                    return True
                else:
                    return False
            else:
                continue
            
        return False

