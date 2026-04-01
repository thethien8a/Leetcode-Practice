"""
https://leetcode.com/problems/insert-interval/
"""
from typing import List

# Not optimize solution
class Solution:
    def insert(self, intervals: List[List[int]], newInterval: List[int]) -> List[List[int]]:
        size_intervals = len(intervals)
        
        have_append_new = 0
        res = []

        for i in range(0, size_intervals):
            if intervals[i][1] < newInterval[0]:
                res.append(intervals[i])
            else:
                if newInterval[1] < intervals[i][0]:
                    if not have_append_new:
                        res.append(newInterval)
                        have_append_new = 1
                    
                    res.append(intervals[i])
                else:
                    if newInterval[0] < intervals[i][0]: 
                        if intervals[i][1] < newInterval[1]:
                            continue
                        else:
                            newInterval = [newInterval[0], intervals[i][1]]
                    else:
                        if newInterval[1] <= intervals[i][1]:
                            newInterval = intervals[i]
                        else:
                            newInterval = [intervals[i][0], newInterval[1]]

        if not have_append_new:
            res.append(newInterval)

        return res


# Optimize solution
class Solution:
    def insert(self, intervals: List[List[int]], newInterval: List[int]) -> List[List[int]]:
        res = []
        for i, interval in enumerate(intervals):
            if interval[1] < newInterval[0]:
                res.append(interval)
            elif newInterval[1] < interval[0]:
                res.append(newInterval)
                return res + intervals[i:]
            else:
                newInterval = [min(newInterval[0], interval[0]),
                               max(newInterval[1], interval[1])]
        res.append(newInterval)
        return res