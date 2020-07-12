defmodule MylistTest do
  use ExUnit.Case
  doctest Mylist

  test "greets the world" do
    assert Mylist.hello() == :world
  end
end
