defmodule Times do
  @moduledoc """
  入力数値を2倍する関数 `double/1` を提供する

  ## e.g
    $ iex times.ex
    iex(1)> Times.double 1
    2
    iex(2)> Times.double 10
    20
  """
  def double(n) do
    n * 2
  end
end
