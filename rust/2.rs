// You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.
//
// You may assume the two numbers do not contain any leading zero, except the number 0 itself.

#[derive(PartialEq, Eq, Clone, Debug)]
pub struct ListNode {
    pub val: i32,
    pub next: Option<Box<ListNode>>,
}

impl ListNode {
    #[inline]
    fn new(val: i32) -> Self {
        ListNode { next: None, val }
    }
}

struct Solution;

impl Solution {
    pub fn add_two_numbers(l1: Option<Box<ListNode>>, l2: Option<Box<ListNode>>) -> Option<Box<ListNode>> {
        Solution::add_two_numbers_recurse(l1, l2, 0)
    }

    fn add_two_numbers_recurse(l1: Option<Box<ListNode>>, l2: Option<Box<ListNode>>, carry: i32) -> Option<Box<ListNode>> {
        match (l1, l2, carry) {
            (None, None, 0) => None,
            (None, None, 1) => Some(Box::new(ListNode { val: 1, next: None })),
            (Some(node1), None, carry) | (None, Some(node1), carry) => {
                let sum = node1.val + carry;
                Some(Box::new(ListNode {
                    val: sum % 10,
                    next: Solution::add_two_numbers_recurse(node1.next, None, sum / 10),
                }))
            }
            (Some(node1), Some(node2), carry) => {
                let sum = node1.val + node2.val + carry;
                Some(Box::new(ListNode {
                    val: sum % 10,
                    next: Solution::add_two_numbers_recurse(node1.next, node2.next, sum / 10),
                }))
            }
            _ => unreachable!(), // Other cases shouldn't be reached given the constraints
        }
    }
}

