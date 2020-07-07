defmodule SumTest do
  use ExUnit.Case
  doctest Sum

  test "greets the world" do
    assert Sum.hello() == :world
  end
end
