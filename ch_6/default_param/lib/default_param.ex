defmodule DefaultParam do
  @moduledoc """
  デフォルトパラメータの挙動を確認する関数を提供する。
  """

  @doc """
  function: default parameter

  ## Examples

      iex> DefaultParam.filled()
      [1, 2, 3]
      iex> DefaultParam.filled(10)
      [10, 2, 3]
      iex> DefaultParam.filled(10, 20)
      [10, 20, 3]
      iex> DefaultParam.filled(10, 20, 30)
      [10, 20, 30]

      iex> DefaultParam.incomplete(10, 20, 30)
      [10, 20, 30]
      iex> DefaultParam.incomplete(10, 30)
      [10, 2, 30]

  """
  def filled(p1 \\ 1, p2 \\ 2, p3 \\ 3) do
    IO.inspect([p1, p2, p3])
  end

  def incomplete(p1, p2 \\ 2, p3) do
    IO.inspect([p1, p2, p3])
  end
end
