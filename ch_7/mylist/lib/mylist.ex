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

  """
  # リストの長さを求める
  def len([]), do: 0
  def len([_head | tail]), do: 1 + len(tail)
end
