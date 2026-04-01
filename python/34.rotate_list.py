"""
https://leetcode.com/problems/rotate-list/
"""

# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def rotateRight(self, head: Optional[ListNode], k: int) -> Optional[ListNode]:
        if head is None:
            return None

        temp = head
        length_list = 0
        while(temp is not None):
            length_list += 1
            temp = temp.next
        
        k = k % length_list

        if k == 0:
            return head
            
        cnt = 1
        node_after = head
        while(cnt < length_list - k):
            node_after = node_after.next
            cnt += 1
        
        temp = node_after.next

        temp_2 = temp
        while(temp_2.next is not None):
            temp_2 = temp_2.next

         
        node_after.next = None

        temp_2.next = head
        return temp
        
        
    