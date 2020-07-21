defmodule CaseSample do
  @moduledoc """
  制御フロー `Case` を組み込んだ関数を提供する。
  """

  @doc """
  Function: CaseSample.controle/1

  ## Examples

      iex> CaseSample.controle("./sample.txt")
      "First line: hogehoge"
      :ok

      iex> CaseSample.controle("./nil.txt")
      "Failed to open file: enoent"
      :ok

  """
  def controle(filename) do
    case File.open(filename) do
      {:ok, file} -> IO.puts("First line: #{IO.read(file, :line)}")
      {:error, reason} -> IO.puts("Failed to open file: #{reason}")
    end
  end

  @doc """
  Function: CaseSample.users/2

  ## Examples

      iex> CaseSample.users("Dave", 27)
      "You are cleared to enter the Foo Bar, Dave"
      :ok

      iex> CaseSample.users("Dave", 20)
      "Sorry, no admission"
      :ok

  """
  def users(name, age) do
    user = %{name: name, age: age}

    case user do
      person = %{age: age} when is_number(age) and age >= 21 ->
        IO.puts("You are cleared to enter the Foo Bar, #{person.name}")

      _ ->
        IO.puts("Sorry, no admission")
    end
  end
end
