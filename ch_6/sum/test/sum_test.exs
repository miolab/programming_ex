defmodule SumTest do
  use ExUnit.Case
  doctest Sum

  test "SUM of 0 expect to be 0" do
    assert Sum.calc(0) == 0
  end

  test "SUM of 2 expect to be 3" do
    assert Sum.calc(2) == 3
  end
end
