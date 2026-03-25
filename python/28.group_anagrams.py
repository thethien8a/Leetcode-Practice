"""
https://leetcode.com/problems/group-anagrams/
"""
from collections import defaultdict
from typing import List

# Not optimize
class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        temp_str = {}

        for each in strs:
            sorted_str = tuple(sorted(each)) 
            if sorted_str in temp_str:
                temp_str[sorted_str].append(each)
            else:
                temp_str[sorted_str] = [each]
        
        return list(temp_str.values()) 
    

# More optimize
class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        temp_str = defaultdict(list)

        for each in strs:
            count = [0] * 26  # đếm 26 chữ cái
            for c in each:
                count[ord(c) - ord('a')] += 1
            
            temp_str[tuple(count)].append(each)
        
        return list(temp_str.values())