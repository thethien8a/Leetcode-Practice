"""
https://leetcode.com/problems/count-and-say/
"""

# Not optimize solution
class Solution:
    def countAndSay(self, n: int) -> str:
        def countSayFunc(res):
            temp_res = ""
            count = 1
            for j in range(0, len(res)):
                if j + 1 == len(res):
                    return temp_res + str(count) + res[j] 
                if res[j+1] == res[j]:
                    count += 1
                else:
                    temp_res = temp_res + str(count) + res[j] 
                    count = 1
            return temp_res
        i = 0
        res = ""
        while(i < n):
            if i == 0:
                res = "1"
            else:
                res = countSayFunc(res)
            i += 1
        return res


# Optimize solution
class Solution:
    def countAndSay(self, n: int) -> str:
        curr = "1"

        for i in range(n-1):
            char = curr[0]
            f = 0
            temp = ""
            for c in curr:
                if c == char:
                    f+=1
                else:
                    temp += (str(f) + char)
                    char = c
                    f = 1
            temp+=(str(f) + char)
            curr = temp
        return curr
