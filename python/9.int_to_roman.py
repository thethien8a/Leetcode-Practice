"""
    https://leetcode.com/problems/integer-to-roman
"""

# class Solution:
#     def intToRoman(self, num: int) -> str:
#         units = ["I", "IV", "V", "IX"]
#         tens = ["X", "XL", "L", "XC"]
#         hundreds = ["C", "CD", "D", "CM"]
#         thousands = ["M"]

#         list_position = [units, tens, hundreds, thousands]
#         position_i = 0
#         result = ""
#         while (num != 0):
#             res = num % 10
#             if res <= 3:
#                 result = res*list_position[position_i][0] + result
#             elif res == 4:
#                 result = list_position[position_i][1] + result
#             elif res == 5:
#                 result = list_position[position_i][2] + result
#             elif res <= 8:
#                 result = list_position[position_i][2] + (res-5)*list_position[position_i][0] + result
#             else:
#                 result = list_position[position_i][3] + result

#             num = num // 10
            
#             # Increase units -> tens, tens -> hundreds, ...
#             position_i += 1

#         return result



# Another solution
class Solution:
    def intToRoman(self, num: int) -> str:
        ones      = ["","I","II","III","IV","V","VI","VII","VIII","IX"]
        tens      = ["","X","XX","XXX","XL","L","LX","LXX","LXXX","XC"]
        hundreds  = ["","C","CC","CCC","CD","D","DC","DCC","DCCC","CM"]
        thousands = ["","M","MM","MMM"]
        
        return (thousands[num // 1000] + 
                hundreds[(num % 1000) // 100] + 
                tens[(num % 100) // 10] + 
                ones[num % 10])