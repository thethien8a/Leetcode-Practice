""" 
https://leetcode.com/problems/merge-intervals/
"""
from typing import List

class Solution:
    def merge(self, intervals: List[List[int]]) -> List[List[int]]:
        if len(intervals) == 1:
            return intervals
        
        sorted_intervals = sorted(intervals, key=lambda x: x[0])  

        def merge_arr(arr1, arr2):
            if arr1[1] >= arr2[0]:                       
                return [arr1[0], max(arr1[1], arr2[1])]  
            return None                                   

        result = []
        temp_arr = sorted_intervals[0]

        for i in range(1, len(sorted_intervals)):          
            merged = merge_arr(temp_arr, sorted_intervals[i])
            if merged:
                temp_arr = merged
            else:
                result.append(temp_arr)
                temp_arr = sorted_intervals[i]

        result.append(temp_arr)                     

        return result