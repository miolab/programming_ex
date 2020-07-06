defmodule TimesTest do
  use ExUnit.Case
  doctest Times

  test "double(n) expect n = 2n" do
    assert Times.double(1) == 2
  end

  test "triple(n) expect n = 3n" do
    assert Times.triple(1) == 3
  end

  test "quarduple(n) expect n = 4n" do
    # refute Times.quadruple(100) == 400
    assert Times.quadruple(100) == 400
  end
end
