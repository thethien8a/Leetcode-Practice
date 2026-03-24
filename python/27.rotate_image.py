"""
https://leetcode.com/problems/rotate-image/
"""
from typing import List

# Not optimize
class Solution:
    def rotate(self, matrix: List[List[int]]) -> None:
        n = len(matrix)
        
        temp_matrix = []

        for i in range(n):
            temp_row = []
            for j in range(n - 1, -1, -1):
                temp_row.append(matrix[j][i])
            temp_matrix.append(temp_row)

        # copy ngược lại
        for i in range(n):
            for j in range(n):
                matrix[i][j] = temp_matrix[i][j]
                

# Optimize
class Solution:
    def rotate(self, matrix: List[List[int]]) -> None:
        n = len(matrix)

        # Bước 1: transpose
        for i in range(n):
            for j in range(i,n):
                matrix[i][j], matrix[j][i] = matrix[j][i], matrix[i][j]

        # Bước 2: reverse từng hàng
        for row in matrix:
            row.reverse()