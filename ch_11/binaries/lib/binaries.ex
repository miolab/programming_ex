defmodule Binaries do
  @moduledoc """
  バイナリ型について確認する関数を提供する。
  """

  @doc """
  Function: Binaries

  ## Examples

      iex> Binaries.byte_check
      4
      iex> Binaries.bit_check
      32

  """

  @my_binary <<1, 2, 3, 4>>

  def byte_check do
    @my_binary |> byte_size() |> IO.inspect()
  end

  def bit_check do
    @my_binary |> bit_size() |> IO.inspect()
  end
end
