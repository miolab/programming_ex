defmodule ChopTest do
  use ExUnit.Case
  doctest Chop

  test "guess number in range" do
    assert Chop.guess(273, 1..1_000) == "Yes! It's 273 !!"
  end

  test "error case: the number out of range" do
    assert Chop.guess(2730, 1..1_000) == "Cannot!: Out of range"
  end
end
