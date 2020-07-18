defmodule CondFizzbuzz do
  @moduledoc """
  制御フロー `cond` により、FizzBuzzリストを返す関数を提供する。
  """

  @doc """
  FizzBuzz by cond

  ## Examples

      iex> CondFizzbuzz.upto(30)
      [1, 2, "Fizz", 4, "Buzz", "Fizz", 7, 8, "Fizz", "Buzz", 11, "Fizz", 13, 14,
      "FizzBuzz", 16, 17, "Fizz", 19, "Buzz", "Fizz", 22, 23, "Fizz", "Buzz", 26,
      "Fizz", 28, 29, "FizzBuzz"]

  """
  def upto(n) when n > 0, do: _upto(1, n, [])

  defp _upto(_current, 0, result), do: Enum.reverse(result)

  defp _upto(current, left, result) do
    next_answer =
      cond do
        rem(current, 15) == 0 -> "FizzBuzz"
        rem(current, 3) == 0 -> "Fizz"
        rem(current, 5) == 0 -> "Buzz"
        true -> current
      end

    _upto(current + 1, left - 1, [next_answer | result])
  end
end

defmodule PatternMatchFizzbuzz do
  @moduledoc """
  condを使わず、パターンマッチによりFizzBuzzリストを返す関数を提供する。
  """

  @doc """
  FizzBuzz by pattern match

  ##Examples

    iex> PatternMatchFizzbuzz.upto(30)
    [1, 2, "Fizz", 4, "Buzz", "Fizz", 7, 8, "Fizz", "Buzz", 11, "Fizz", 13, 14,
    "FizzBuzz", 16, 17, "Fizz", 19, "Buzz", "Fizz", 22, 23, "Fizz", "Buzz", 26,
    "Fizz", 28, 29, "FizzBuzz"]

  """
  def upto(n) when n > 0, do: 1..n |> Enum.map(&fizzbuzz/1)

  defp fizzbuzz(n), do: _fizzword(n, rem(n, 3), rem(n, 5))

  defp _fizzword(_n, 0, 0), do: "FizzBuzz"
  defp _fizzword(_n, 0, _), do: "Fizz"
  defp _fizzword(_n, _, 0), do: "Buzz"
  defp _fizzword(n, _, _), do: n
end
