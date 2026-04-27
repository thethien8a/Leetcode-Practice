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
    


class Solution:
    def removeDuplicates(self, nums: List[int]) -> int:
        n = len(nums)
        start = 1

        if(n <= 2):
            return n
        
        
        for i in range(2,n):
            if(nums[start-1] != nums[i]):       # just changed the nums[i] to nums[i-1] (it will look back 2 elemetns)
                start += 1
                #count += 1
                nums[start] = nums[i]

        return start+1