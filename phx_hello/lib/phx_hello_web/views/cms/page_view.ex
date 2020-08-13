defmodule PhxHelloWeb.CMS.PageView do
  use PhxHelloWeb, :view

  alias PhxHello.CMS

  def author_name(%CMS.Page{author: author}) do
    author.user.name
  end
end
