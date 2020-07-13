defmodule InfinityTest do
  use ExUnit.Case
  doctest Infinity

  test "enum_pipeline" do
    assert Infinity.enum_pipeline() == [2, 3, 4, 5, 6]
  end

  test "stream_pipeline" do
    assert Infinity.enum_pipeline() == [2, 3, 4, 5, 6]
  end
end
