defmodule Comprehension do
  @moduledoc """
  内包表記による生成リストを返す関数を提供する。
  """

  @doc """
  Function: Comprehension

  ## Examples

      # リスト内要素を2乗する
      iex> Comprehension.square([1, 2, 3, 4, 5])
      [1, 4, 9, 16, 25]

      iex> Comprehension.square_limit_three([1, 2, 3, 4, 5])
      [1, 4, 9]

      # キーワードリストのキーと値を入れ替える
      iex> Comprehension.replace_key_param([kitaq: :clear, fukuoka: :raining, shimonoseki: :smoggy])
      [clear: :kitaq, raining: :fukuoka, smoggy: :shimonoseki]

  """
  def square(arr) do
    for x <- arr, do: x * x
  end

  def square_limit_three(arr) do
    for x <- arr, x < 4, do: x * x
  end

  def replace_key_param(keyword_list) do
    for {x, y} <- keyword_list, do: {y, x}
  end
end
