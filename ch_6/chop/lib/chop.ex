defmodule Chop do
  @moduledoc """
  1から1000まで範囲にある、ある1つの整数を推測する関数を提供する。
  """

  @doc """
  Function: guessing int N (in 1..1000)

  ## Examples

      iex> Chop.guess(273, 1..1_000)
      "Is it 500 ?"
      "Is it 250 ?"
      "Is it 375 ?"
      "Is it 312 ?"
      "Is it 281 ?"
      "Is it 265 ?"
      "Is it 273 ?"
      "Yes! It's 273 !!"

  """
  def guess(actual, range = low..high) do
    guess = div(low + high, 2)
    IO.inspect("Is it #{guess} ?")
    _guess(actual, guess, range)
  end

  defp _guess(actual, actual, _), do: IO.inspect("Yes! It's #{actual} !!")

  defp _guess(actual, guess, _low..high) when guess < actual do
    guess(actual, (guess + 1)..high)
  end

  defp _guess(actual, guess, low..high) when guess > actual do
    guess(actual, low..(guess - 1))
  end
end
