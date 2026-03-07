"""
https://leetcode.com/problems/3sum/
"""

# Not optimized
# class Solution:
#     def threeSum(self, nums: list[int]) -> list[list[int]]:
        
#         if len(nums) == 3:
#             return [nums] if (nums[0] + nums[1] + nums[2] == 0) else []

#         res = []
#         nums = sorted(nums)
#         for i in range(len(nums)):
#             if i-1 >= 0:
#                 if nums[i] == nums[i-1]:
#                     continue
#             j = i+1
#             while (j < len(nums)):
#                 if (j-1) != i:
#                     if nums[j] == nums[j-1]:
#                         j += 1
#                         continue
#                 k = j+1
#                 while (k < len(nums)):
#                     if (k-1) != j:
#                         if nums[k] == nums[k-1]:
#                             k += 1
#                             continue
#                     if (nums[i] + nums[j] + nums[k] == 0):
#                         res.append([nums[i],nums[j],nums[k]])
#                     k += 1
#                 j += 1
#         return res


# Better solution
class Solution:
    def threeSum(self, nums: list[int]) -> list[list[int]]:
        nums.sort()
        res = []
        n = len(nums)

        for i in range(n):

            if i > 0 and nums[i] == nums[i-1]:
                continue

            left = i + 1
            right = n - 1

            while left < right:
                total = nums[i] + nums[left] + nums[right]

                if total == 0:
                    res.append([nums[i], nums[left], nums[right]])

                    left += 1
                    right -= 1

                    while left < right and nums[left] == nums[left-1]:
                        left += 1
                    while left < right and nums[right] == nums[right+1]:
                        right -= 1

                elif total < 0:
                    left += 1
                else:
                    right -= 1

        return res