defmodule Strings do
  @moduledoc """
  文字列リテラルについて確認する関数を提供する。
  """

  @doc """
  Function: Strings

  ## Examples

      # ヒアドキュメント
      iex> Strings.here_document
      hello im
      hello miolab

      hello world

  """
  def hello do
    :world
  end

  @str """
  hello im
  hello miolab

  hello world
  """

  def here_document, do: @str |> IO.write()
end
