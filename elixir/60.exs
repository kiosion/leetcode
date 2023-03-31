# The set [1, 2, 3, ..., n] contains a total of n! unique permutations.
# By listing and labeling all of the permutations in order, we get the following sequence for n = 3:
# "123", "132", "213", "231", "312", "321"
#
# Given n and k, return the kth permutation sequence.

defmodule Solution do
  @spec get_permutation(n :: integer, k :: integer) :: String.t
  def get_permutation(n, k) do
    nums = Enum.to_list 1..n
    fact = compute_factorials n
    find_permutation n, k, fact, nums, ""
  end

  defp compute_factorials(n), do: Enum.to_list Enum.scan 1..n, 1, &*/2

  defp find_permutation(0, _k, _fact, _nums, acc), do: acc
  defp find_permutation(n, k, fact, nums, acc) do
    index = div k - 1, Enum.at(fact, n - 2)
    num = Enum.at nums, index
    updated_nums = List.delete nums, num
    updated_k = k - index * Enum.at fact, n - 2
    find_permutation n - 1, updated_k, fact, updated_nums, acc <> Integer.to_string(num)
  end
end

