defmodule Times do
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
    iex> Times.triple(100)
    300

  ## e.g 2
    iex> c "times.ex"
    [Times]
    iex> Times.triple 2
    6
  """
  def double(n), do: n * 2
  def triple(n), do: n * 3
end
