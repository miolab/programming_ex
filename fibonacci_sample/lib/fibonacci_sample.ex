defmodule FibonacciSample do
  @moduledoc """
  Documentation for FibonacciSample.
  1, 1, 2, 3, 5, 8, ... , (n-2)+(n-1)
  """

  @doc """
  Fibonacci calculation test.

  ## Examples

      iex> FibonacciSample.nth(1)
      1

  """

  def nth(1), do: 1
  def nth(2), do: 1
  def nth(n), do: nth(n - 2) + nth(n - 1)
end
