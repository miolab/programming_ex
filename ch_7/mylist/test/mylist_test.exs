defmodule MylistTest do
  use ExUnit.Case
  doctest Mylist

  test "function: count length of list" do
    assert Mylist.len([]) == 0
    assert Mylist.len(["a", "b", "c"]) == 3
  end
end
