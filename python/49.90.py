"""
    https://leetcode.com/problems/subsets-ii/
"""
from typing import List

class Solution:
    def subsetsWithDup(self, nums: List[int]) -> List[List[int]]:
        res = []
        # Sắp xếp mảng để gom các phần tử trùng nhau lại gần nhau
        nums.sort()
        
        def backtrack(start: int, current_subset: List[int]):
            # Thêm bản sao của tập con hiện tại vào kết quả
            res.append(list(current_subset))
            
            for i in range(start, len(nums)):
                # Nếu phần tử hiện tại trùng với phần tử ngay trước nó 
                # trong cùng một tầng của cây quyết định, ta bỏ qua để tránh trùng lặp
                if i > start and nums[i] == nums[i - 1]:
                    continue
                
                # Chọn phần tử nums[i]
                current_subset.append(nums[i])
                
                # Di chuyển đến phần tử tiếp theo
                backtrack(i + 1, current_subset)
                
                # Quay lui (backtrack): bỏ phần tử vừa chọn ra để thử hướng khác
                current_subset.pop()
        
        backtrack(0, [])
        return res