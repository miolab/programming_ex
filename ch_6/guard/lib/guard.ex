defmodule Guard do
  @moduledoc """
  Documentation for `Guard`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Guard.hello()
      :world
      iex> Guard.what_is(100)
      "100 is a Number."

  """
  def hello do
    :world
  end

  def what_is(x) when is_number(x) do
    IO.inspect("#{x} is a Number.")
  end
end
