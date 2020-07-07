defmodule FactorialTest do
  use ExUnit.Case
  doctest Factorial

  test "" do
    assert Factorial.of(0) == 0
  end
end
