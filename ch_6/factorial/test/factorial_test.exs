defmodule FactorialTest do
  use ExUnit.Case
  doctest Factorial

  test "0! expected to be 1" do
    assert Factorial.of(0) == 1
  end

  test "3! expected to be 1" do
    assert Factorial.of(3) == 6
  end

  test "10! expected to be 3628800" do
    assert Factorial.of(10) == 3_628_800
  end

  test "-2 expected to be FunctionClauseError" do
    num_negative = -2
    assert_raise FunctionClauseError, fn -> Factorial.of(num_negative) end
  end
end
