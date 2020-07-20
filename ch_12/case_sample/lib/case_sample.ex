defmodule CaseSample do
  @moduledoc """
  制御フロー `Case` を組み込んだ関数を提供する。
  """

  @doc """
  Function: CaseSample

  ## Examples

      iex> CaseSample.controle("./sample.txt")
      "First line: hogehoge"
      :ok

      iex> CaseSample.controle("./nil.txt")
      "Failed to open file: enoent"
      :ok

  """
  def hello do
    :world
  end

  def controle(filename) do
    case File.open(filename) do
      {:ok, file} -> IO.puts("First line: #{IO.read(file, :line)}")
      {:error, reason} -> IO.puts("Failed to open file: #{reason}")
    end
  end
end
