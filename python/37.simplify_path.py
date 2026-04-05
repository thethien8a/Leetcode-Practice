"""
    https://leetcode.com/problems/simplify-path/
"""

class Solution:
    def simplifyPath(self, path: str) -> str:

        parts = path.split("/")
        stack = []

        for each in parts:
            if each == "..":
                if len(stack) > 0:
                    stack.pop()
            elif each == "" or each == ".":
                continue
            else:
                stack.append(each)

        return "/" + "/".join(stack)
                
                