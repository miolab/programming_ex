defmodule Guard do
  @moduledoc """
  ガード節で型判別を行う関数を提供する。
  """

  @doc """
  Function Usage:

  ## Examples

      iex> Guard.what_is(100)
      "100 is a Number."

      iex> Guard.what_is("im")
      "im is a Binary."

      iex> Guard.what_is(:miolab)
      "miolab is a Atom."

  """
  def what_is(x) when is_number(x) do
    IO.inspect("#{x} is a Number.")
  end

  def what_is(x) when is_binary(x) do
    IO.inspect("#{x} is a Binary.")
  end

  def what_is(x) when is_atom(x) do
    IO.inspect("#{x} is a Atom.")
  end
end
