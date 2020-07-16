defmodule Comprehension do
  @moduledoc """
  内包表記による生成コレクションを返す関数を提供する。
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

      # リスト内の単語要素に対し、小文字（大文字）を併記したマップを返す
      iex> ~w{cat dog} |> Comprehension.map_upcase
      %{"cat" => "CAT", "dog" => "DOG"}

      iex> ~w{APPLE ORANGE BANANA } |> Comprehension.map_downcase
      %{"APPLE" => "apple", "BANANA" => "banana", "ORANGE" => "orange"}
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

  def map_upcase(arr) do
    for x <- arr, into: %{}, do: {x, String.upcase(x)}
  end

  def map_downcase(arr) do
    for x <- arr, into: Map.new(), do: {x, String.downcase(x)}
  end
end
