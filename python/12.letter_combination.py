""" 
https://leetcode.com/problems/letter-combinations-of-a-phone-number/
"""
from typing import List


class Solution:
    def letterCombinations(self, digits: str) -> List[str]:
        if not digits:
            return []

        mapping = {
            "2": "abc", "3": "def", "4": "ghi", "5": "jkl",
            "6": "mno", "7": "pqrs", "8": "tuv", "9": "wxyz",
        }
        res: List[str] = []

        def de_quy(i: int, my_str: str) -> None:
            if i == len(digits):
                res.append(my_str)
                return
            for char in mapping[digits[i]]:
                de_quy(i + 1, my_str + char)  

        de_quy(0, "")
        return res

