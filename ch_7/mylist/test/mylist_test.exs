defmodule MylistTest do
  use ExUnit.Case
  doctest Mylist

  test "function: count length of list" do
    list = ["a", "b", "c"]
    list_a_len = list |> Mylist.len()
    list_b_len = list |> length
    assert list_a_len == list_b_len
  end

  test "function: square each param of list" do
    list = [1, 2, 3]
    list_a = list |> Mylist.square()
    list_b = list |> Enum.map(&(&1 * &1))
    assert list_a == list_b
  end
end
