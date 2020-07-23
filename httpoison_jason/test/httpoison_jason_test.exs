defmodule HttpoisonJasonTest do
  use ExUnit.Case
  doctest HttpoisonJason

  test "greets the world" do
    assert HttpoisonJason.hello() == :world
  end
end
