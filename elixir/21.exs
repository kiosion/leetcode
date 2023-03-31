# You are given the heads of two sorted linked lists list1 and list2.
#
# Merge the two lists in a one sorted list. The list should be made by splicing together the nodes of the first two lists.
#
# Return the head of the merged linked list.

defmodule ListNode do
  defstruct [:val, :next]
end

defmodule Solution do
  @spec merge_two_lists(list1 :: ListNode.t | nil, list2 :: ListNode.t | nil) :: ListNode.t | nil
  def merge_two_lists(list1, list2), do: merge list1, list2, nil

  defp merge(nil, list2, acc), do: append_reverse acc, list2
  defp merge(list1, nil, acc), do: append_reverse acc, list1
  defp merge(list1, list2, acc) do
    if list1.val < list2.val do
      merge list1.next, list2, %ListNode{val: list1.val, next: acc}
    else
      merge list1, list2.next, %ListNode{val: list1.val, next: acc}
    end
  end

  defp append_reverse(nil, list), do: list
  defp append_reverse(%ListNode{val: val, next: next_node} = _head, list) do
    append_reverse next_node, %ListNode{val: val, next: list}
  end
end

