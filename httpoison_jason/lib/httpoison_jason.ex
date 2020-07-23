defmodule HttpoisonJason do
  @moduledoc """
  Documentation for `HttpoisonJason`.
  """

  @doc """
  Function GET

  ## Examples

      iex> HttpoisonJason.app_status
      200

  """

  @url "https://jsonplaceholder.typicode.com/users"

  def app_status do
    response.status_code |> IO.inspect()
  end

  def app_headers do
    response.headers |> IO.inspect()
  end

  def app_body do
    response.body |> IO.inspect()
  end

  defp response do
    @url |> HTTPoison.get!()
  end
end
