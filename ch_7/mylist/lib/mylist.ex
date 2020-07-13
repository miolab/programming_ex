defmodule Mylist do
  @moduledoc """
  再帰的にリストを処理する関数を提供する。
  """

  @doc """
  Function: Mylist

  ## Examples

      # リストの長さを求める
      iex> Mylist.len([])
      0
      iex> Mylist.len(["a", "b", "c"])
      3

      # リストの各要素を2条する
      iex> Mylist.square([])
      []
      iex> Mylist.square([1, 2, 3])
      [1, 4, 9]

  """
  # リストの長さを求める
  def len([]), do: 0
  def len([_head | tail]), do: 1 + len(tail)

  # リストの各要素を2条する
  def square([]), do: []
  def square([head | tail]), do: [head * head | square(tail)]
end
