"""
https://leetcode.com/problems/sort-colors/
"""

from typing import List

class Solution:
    def sortColors(self, nums: List[int]) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        count_0 = 0
        count_1 = 0
        count_2 = 0
        
        for num in nums:
            if num == 2:
                count_2 += 1
            elif num == 1:
                count_1 += 1
            else:
                count_0 += 1
        
        i = 0
        while(count_0 > 0):
            nums[i] = 0
            count_0 -= 1
            i += 1

        while(count_1 > 0):
            nums[i] = 1
            count_1 -= 1
            i += 1
        
        while(count_2 > 0):
            nums[i] = 2
            count_2 -= 1
            i += 1


# Dutch National Flag
class Solution:
    def sortColors(self, nums: list[int]) -> None:
        low, mid = 0, 0
        high = len(nums) - 1
        
        while mid <= high:
            if nums[mid] == 0:
                # Đưa số 0 về phía đầu
                nums[low], nums[mid] = nums[mid], nums[low]
                low += 1
                mid += 1
            elif nums[mid] == 1:
                # Số 1 ở đúng vị trí giữa, chỉ việc tiến tới
                mid += 1
            else: # nums[mid] == 2
                # Đưa số 2 về phía cuối
                nums[mid], nums[high] = nums[high], nums[mid]
                high -= 1