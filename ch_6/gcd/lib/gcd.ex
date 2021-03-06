defmodule Gcd do
  @moduledoc """
  2つの正の整数 x, y における最大公約数を求める関数を提供する。
  * yが0のときはxを返す
  """

  @doc """
  function of GCD.

  ## Examples

      iex> Gcd.calc(10, 0)
      10
      iex> Gcd.calc(10, 25)
      5

  """
  def calc(x, 0), do: x
  def calc(x, y), do: calc(y, rem(x, y))
end
