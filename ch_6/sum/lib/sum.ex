defmodule Sum do
  @moduledoc """
  整数の合計値を計算する関数を提供する。
  """

  @doc """
  Function calc SUM with recursive.

  ## Examples

      iex> Sum.calc_sum(0)
      0

  """
  def calc_sum(0), do: 0
end
