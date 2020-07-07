defmodule Factorial do
  @moduledoc """
  階乗を計算する関数を提供する。
  """

  @doc """
  function: n!

  ## Examples

      iex> Factorial.of(0)
      1
      iex> Factorial.of(3)
      6

  """
  def of(0), do: 1
  def of(n), do: n * of(n - 1)
end