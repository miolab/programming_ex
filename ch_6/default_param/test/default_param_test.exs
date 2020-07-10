defmodule DefaultParamTest do
  use ExUnit.Case
  doctest DefaultParam

  test "greets the world" do
    assert DefaultParam.hello() == :world
  end
end
