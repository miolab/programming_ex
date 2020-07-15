defmodule Comprehension do
  @moduledoc """
  内包表記
  """

  @doc """
  Function: Comprehension

  ## Examples

      iex> Comprehension.square([1, 2, 3, 4, 5])
      [1, 4, 9, 16, 25]

  """
  def hello do
    :world
  end

  def square(arr) do
    for x <- arr, do: x * x
  end
end
