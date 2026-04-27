"""
https://leetcode.com/problems/remove-duplicates-from-sorted-array-ii/
"""

class Solution:
    def removeDuplicates(self, nums: List[int]) -> int:
        length_nums = len(nums)
        
        if length_nums <= 2:
            return length_nums
        
        i = 0
        change_index = 0
        while(True):
            j = i + 1

            check_var = 0 # To check whether more than 2 nums
            while(j < length_nums and nums[i] == nums[j]):
                check_var += 1
                j += 1

            if(check_var):
                nums[change_index] = nums[i]
                nums[change_index+1] = nums[i]
                change_index += 2
            else:
                nums[change_index] = nums[i]
                change_index += 1
            
            if j == length_nums:
                break
            else:
                i = j
            
        return change_index