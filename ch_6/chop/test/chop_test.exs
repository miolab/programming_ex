defmodule ChopTest do
  use ExUnit.Case
  doctest Chop

  test "greets the world" do
    assert Chop.hello() == :world
  end
end
