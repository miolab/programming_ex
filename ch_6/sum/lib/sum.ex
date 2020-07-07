defmodule Sum do
  @moduledoc """
  整数の合計値を計算する関数を提供する。
  """

  @doc """
  Function calc SUM with recursive.

  ## Examples

      iex> Sum.calc(0)
      0
      iex> Sum.calc(2)
      3

  """
  def calc(0), do: 0
  def calc(n), do: n + calc(n - 1)
end
