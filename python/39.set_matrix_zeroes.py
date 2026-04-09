"""
https://leetcode.com/problems/set-matrix-zeroes/
"""

class Solution:
    def setZeroes(self, matrix: List[List[int]]) -> None:
        """
        Do not return anything, modify matrix in-place instead.
        """
        
        def is_needed_change(matrix,row,col):
            if matrix[row][col] == 0:
                return 0
            else:
                return 1

        num_row = len(matrix)
        num_col = len(matrix[0])

        zero_position = []
        for r in range(num_row):
            for c in range(num_col):
                if matrix[r][c] == 0:
                    zero_position.append((r,c))

        for each in zero_position:
            r = each[0]
            c = each[1]
            
            temp = r-1
            while(temp >= 0):
                if is_needed_change(matrix,temp,c):
                    matrix[temp][c] = 0
                temp -= 1
            
            temp = r+1
            while(temp < num_row):
                if is_needed_change(matrix,temp,c):
                    matrix[temp][c] = 0
                temp += 1
            
            temp = c-1
            while(temp >= 0):
                if is_needed_change(matrix,r,temp):
                    matrix[r][temp] = 0
                temp -= 1

            temp = c+1
            while(temp < num_col):
                if is_needed_change(matrix,r,temp):
                    matrix[r][temp] = 0
                temp += 1
            