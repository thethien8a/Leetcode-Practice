"""
    https://leetcode.com/problems/remove-duplicates-from-sorted-list-ii/
"""
from typing import Optional

# Definition for singly-linked list.
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

# Not optimize
class Solution:
    def deleteDuplicates(self, head: Optional[ListNode]) -> Optional[ListNode]:
        if not head:
            return None
            
        if not head.next:
            return head
        
        res = ListNode(0) # first node is the temp node, result list start from res.next
        tmp_res = res
        check_dup = 0
        tmp_val = head.val

        while(head is not None):
            head = head.next

            if head:
                if tmp_val == head.val:
                    check_dup += 1
                else:
                    if not check_dup:
                        tmp_res.next = ListNode(tmp_val)
                        tmp_res = tmp_res.next

                    tmp_val = head.val
                    check_dup = 0

        if not check_dup:
            tmp_res.next = ListNode(tmp_val)

        return res.next

# More optimize
class Solution:
    def deleteDuplicates(self, head: Optional[ListNode]) -> Optional[ListNode]:
        dummy = ListNode(0, head)
        prev = dummy

        curr = head
        while curr:
            if curr.next and curr.val == curr.next.val:
                # 1. Skip duplicates
                while curr.next and curr.val == curr.next.val:
                    curr = curr.next
                prev.next = curr.next
            else:
                # 2. Simply move next
                prev = prev.next
            
            curr = curr.next

        return dummy.next