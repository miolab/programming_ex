defmodule Comprehension do
  @moduledoc """
  内包表記により、リスト内要素を2乗したリストを返す関数を提供する。
  """

  @doc """
  Function: Comprehension

  ## Examples

      iex> Comprehension.square([1, 2, 3, 4, 5])
      [1, 4, 9, 16, 25]

      iex> Comprehension.square_limit_three([1, 2, 3, 4, 5])
      [1, 4, 9]

  """
  def square(arr) do
    for x <- arr, do: x * x
  end

  def square_limit_three(arr) do
    for x <- arr, x < 4, do: x * x
  end
end
