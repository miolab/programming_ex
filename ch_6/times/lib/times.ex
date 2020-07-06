defmodule Times do
  @moduledoc """
  入力数値を2倍・3倍・4倍に掛け算する関数を提供する
  ## Usage of start
    * `iex times.ex`
    * または、`iex`に入ってから、`iex> c "times.ex"`
  """

  @doc """
  Times function test:

  ## e.g

    iex> Times.double(10)
    20
    iex> Times.triple(1)
    3
    iex> Times.quadruple(100)
    400
    iex> Times.quadruple 100  # こう書いても実行可能
    400

  """

  def double(n), do: n * 2
  def triple(n), do: n * 3
  def quadruple(n), do: double(n) |> double
end
