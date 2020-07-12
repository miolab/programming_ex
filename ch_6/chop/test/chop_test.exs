defmodule ChopTest do
  use ExUnit.Case
  doctest Chop

  test "greets the world" do
    assert Chop.guess(273, 1..1_000) == "Yes! It's 273 !!"
  end
end
