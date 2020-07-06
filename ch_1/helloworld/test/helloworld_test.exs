defmodule HelloworldTest do
  use ExUnit.Case
  doctest Helloworld

  test "greets the world" do
    # assert Helloworld.hello() == :world
    assert Helloworld.hello() == "Hello world, im!"
  end
end
