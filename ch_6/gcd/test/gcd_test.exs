defmodule GcdTest do
  use ExUnit.Case
  doctest Gcd

  test "greets the world" do
    assert Gcd.hello() == :world
  end
end
