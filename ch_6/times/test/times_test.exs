defmodule TimesTest do
  @moduledoc """
  入力数値を掛け算する関数 `double/1` を提供する

  ## e.g 1
    $ iex times.ex
    iex> Times.double 1
    2
    iex> Times.double(10)
    20
    iex> Times.triple 1
    3
    iex> Times.quarduple(100)
    400

  ## e.g 2
    iex> c "times.ex"
    [Times]
    iex> Times.triple 2
    6
  """
  use ExUnit.Case
  doctest Times

  test "1st test" do
    assert Times.double(1) == 2
  end
end
