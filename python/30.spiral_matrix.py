"""
https://leetcode.com/problems/spiral-matrix/
"""
from typing import List

class Solution:
    def spiralOrder(self, matrix: List[List[int]]) -> List[int]:
        res = []

        num_column = len(matrix[0])
        num_row = len(matrix)

        def finding_arr(matrix, minus_row, minus_col):

            
            # All first row
            for i in range(minus_col, num_column-minus_col):
                res.append(matrix[minus_row][i])

            if len(res) == num_column * num_row:
                return            

            # All last col
            for j in range(minus_row+1,num_row-minus_row):
                res.append(matrix[j][num_column-1-minus_col])
            
            if len(res) == num_column * num_row:
                return
                
            # All last row
            for k in range(num_column-2-minus_col,minus_col-1,-1):
                res.append(matrix[num_row-1-minus_row][k])
            
            if len(res) == num_column * num_row:
                return            

            # All first col
            for l in range(num_row-2-minus_row, minus_row,-1):
                res.append(matrix[l][minus_col])

            if len(res) == num_column * num_row:
                return            


            finding_arr(matrix,minus_row+1,minus_col+1)
        
        finding_arr(matrix,0,0)

        return res