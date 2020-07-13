defmodule Infinity do
  @moduledoc """
  1億個の要素を持つリストに対して、各要素に処理を施し、最初の5要素を取り出す関数を提供する。
  """

  @doc """
  Function: Infinity

  ## Examples

      iex> Infinity.enum_pipeline
      [2, 3, 4, 5, 6]

      iex(8)> Infinity.stream_pipeline
      [2, 3, 4, 5, 6]

  """
  def hello do
    :world
  end

  @arr 1..100_000_000

  def enum_pipeline do
    @arr
    |> Enum.map(&(&1 + 1))
    |> Enum.take(5)
    |> IO.inspect()
  end

  def stream_pipeline do
    @arr
    |> Stream.map(&(&1 + 1))
    |> Enum.take(5)
    |> IO.inspect()
  end
end
