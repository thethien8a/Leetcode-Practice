"""
    https://leetcode.com/problems/partition-list/
"""
from typing import Optional

# Definition for singly-linked list.
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

class Solution:
    def partition(self, head: Optional[ListNode], x: int) -> Optional[ListNode]:
        left = ListNode(0)
        temp_left = left
        right = ListNode(0)
        temp_right = right

        while(head is not None):
            if head.val < x:
                temp_left.next = ListNode(head.val)
                temp_left = temp_left.next
            else:
                temp_right.next = ListNode(head.val)
                temp_right = temp_right.next 
            head = head.next
        
        temp_left.next = right.next

        return left.next
