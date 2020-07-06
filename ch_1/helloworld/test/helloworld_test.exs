defmodule HelloworldTest do
  use PowerAssert
  doctest Helloworld

  test "hello function test" do
    # assert Helloworld.hello() == :world
    assert Helloworld.hello() == "Hello world, im!"
  end
end
