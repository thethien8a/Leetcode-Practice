"""
    https://leetcode.com/problems/unique-paths/
"""

# Đệ quy
class Solution:
    def uniquePaths(self, m: int, n: int) -> int:
        res = 0

        def brute_force(go_down, go_right):
            nonlocal res 

            if go_down == m and go_right == n:
                res += 1
                return 

            if go_down > m or go_right > n:
                return

            brute_force(go_down + 1, go_right)
            brute_force(go_down, go_right + 1)

        brute_force(1, 1)
        return res
    

# Quy hoạch động
class Solution:
    def uniquePaths(self, m: int, n: int) -> int:
        def solve(row, col):
            # Nếu đến đích, trả về 1 đường đi thành công
            if row == m and col == n:
                return 1
            
            # Nếu đi ra ngoài lưới, trả về 0
            if row > m or col > n:
                return 0
            
            # Tổng đường đi = đi xuống + đi phải
            return solve(row + 1, col) + solve(row, col + 1)

        return solve(1, 1)

import math
# Tối ưu
class Solution:
    def uniquePaths(self, m: int, n: int) -> int:
        return math.comb(m + n - 2, m - 1)

# Giải thích:
# Có tổng cộng (m-1) + (n-1) ô. Trong (m-1)+(n-1) ô đó, ta được phép chọn (n-1) bước là sang phải, các ô còn lại sẽ là bước xuống