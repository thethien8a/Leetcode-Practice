"""
https://leetcode.com/problems/combinations/
"""

class Solution:
    def combine(self, n: int, k: int) -> List[List[int]]:
        result = []

        def backtrack(start, arr):
            if len(arr) == k:
                result.append(arr[:])  # ✅ copy
                return

            for i in range(start, n + 1):
                arr.append(i)
                backtrack(i + 1, arr)  # ✅ i+1 tránh duplicate
                arr.pop()

        backtrack(1, [])
        return result