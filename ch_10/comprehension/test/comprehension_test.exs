defmodule ComprehensionTest do
  use ExUnit.Case
  doctest Comprehension

  test "greets the world" do
    assert Comprehension.hello() == :world
  end
end
