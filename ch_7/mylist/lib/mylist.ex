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

      # リストの各要素を2乗する
      iex> Mylist.square([])
      []
      iex> Mylist.square([1, 2, 3])
      [1, 4, 9]

      # リストの各要素に1を足す
      iex(3)> Mylist.add_1([])
      []
      iex> Mylist.add_1([1, 2, 3])
      [2, 3, 4]

  """
  # リストの長さを求める
  def len([]), do: 0
  def len([_head | tail]), do: 1 + len(tail)

  # リストの各要素を2乗する
  def square([]), do: []
  def square([head | tail]), do: [head * head | square(tail)]

  # リストの各要素に1を足す
  def add_1([]), do: []
  def add_1([head | tail]), do: [head + 1 | add_1(tail)]
end
