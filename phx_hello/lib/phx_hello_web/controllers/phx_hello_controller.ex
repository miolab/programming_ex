defmodule PhxHelloWeb.PhxHelloController do
  use PhxHelloWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
