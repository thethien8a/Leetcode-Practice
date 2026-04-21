"""
https://leetcode.com/problems/word-search/
"""
import collections
from typing import List


class Solution:
    def exist(self, board: List[List[str]], word: str) -> bool:
        n_rows = len(board)
        n_cols = len(board[0])
        size_word = len(word)

        def is_exist(i, j, count):
            # Nếu đã khớp hết độ dài từ, chúc mừng bạn đã "về đích"
            if count == size_word:
                return True
            
            # Kiểm tra biên và ký tự có khớp không
            if i < 0 or i >= n_rows or j < 0 or j >= n_cols or board[i][j] != word[count]:
                return False

            # Đánh dấu ô này là đã dùng (Backtracking step 1)
            temp = board[i][j]
            board[i][j] = "#"

            # Thử cả 4 hướng: Lên, Xuống, Trái, Phải
            # Chỉ cần 1 hướng trả về True là đủ
            found = (is_exist(i - 1, j, count + 1) or 
                     is_exist(i + 1, j, count + 1) or 
                     is_exist(i, j - 1, count + 1) or 
                     is_exist(i, j + 1, count + 1))

            # Trả lại ký tự gốc để các lần tìm kiếm từ ô khác không bị ảnh hưởng (Backtracking step 2)
            board[i][j] = temp
            
            return found

        for i in range(n_rows):
            for j in range(n_cols):
                # Bắt đầu DFS từ ô có ký tự đầu tiên khớp
                if board[i][j] == word[0]:
                    if is_exist(i, j, 0): # Bắt đầu count từ 0 để check luôn ô hiện tại
                        return True
        
        return False