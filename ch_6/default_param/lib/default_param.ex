defmodule DefaultParam do
  @moduledoc """
  Documentation for `DefaultParam`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> DefaultParam.hello()
      :world

      iex> DefaultParam.incomplete(1, 3)
      [1, 2, 3]

  """
  def hello do
    :world
  end

  def filled(p1 \\ 1, p2 \\ 2, p3 \\ 3) do
    IO.inspect([p1, p2, p3])
  end

  def incomplete(p1, p2 \\ 2, p3) do
    IO.inspect([p1, p2, p3])
  end
end
