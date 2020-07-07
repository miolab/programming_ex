defmodule SumTest do
  use ExUnit.Case
  doctest Sum

  test "SUM of 0 expect to be 0" do
    assert Sum.calc_sum(0) == 0
  end
end
