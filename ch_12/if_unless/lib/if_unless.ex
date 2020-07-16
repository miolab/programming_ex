defmodule IfUnless do
  @moduledoc """
  制御フローを組み込んだ各関数を提供する。
  """

  @doc """
  Function: if and unless

  ## Examples

      iex> IfUnless.judge_int_1_if(1)
      "true"
      iex> IfUnless.judge_int_1_if(10)
      "false"

      iex> IfUnless.judge_int_1_unless(1)
      "mutch: ok"
      iex> IfUnless.judge_int_1_unless(10)
      "not mutch: error"

  """

  def judge_int_1_if(int) do
    if int == 1,
      do: "true",
      else: "false"
  end

  def judge_int_1_unless(int) do
    unless int == 1,
      do: "not mutch: error",
      else: "mutch: ok"
  end
end
