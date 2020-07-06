defmodule TimesTest do
  @moduledoc """
  入力数値を掛け算する関数 `double/1` を提供する

  ## e.g 1
    $ iex times.ex
    iex> Times.double(10)
    20
    iex> Times.triple(1)
    3
    iex> Times.quadruple(100)
    400
    iex> Times.quadruple 100  # こう書いても実行可能

  ## e.g 2
    $ iex  # iexに入ってから開始
    iex> c "times.ex"
    [Times]
    iex> Times.triple 2
    6
  """
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
