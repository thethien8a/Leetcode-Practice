"""
https://leetcode.com/problems/combination-sum
"""
from typing import List

# Backtracking algorithm (Still my bad)
class Solution:
    def combinationSum(self, candidates: List[int], target: int) -> List[List[int]]:
        n = len(candidates)
        res = []
        
        def dfs(i, curr, path: list):
            if curr == 0:
                res.append(path[:])
                return
            
            if (i == n and curr != 0) or curr < 0:
                return
            
            path.append(candidates[i])
            dfs(i, curr - candidates[i], path)
            path.pop()
            dfs(i+1, curr, path)
        
        dfs(0, target, [])
        return res