defmodule GcdTest do
  use ExUnit.Case
  doctest Gcd

  test "return x, if y = 0" do
    assert Gcd.calc(10, 0) == 10
  end
end
