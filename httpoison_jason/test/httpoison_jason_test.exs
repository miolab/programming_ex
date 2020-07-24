defmodule HttpoisonJasonTest do
  use ExUnit.Case
  doctest HttpoisonJason

  test "GET username" do
    assert HttpoisonJason.app_body() == [
             "Bret",
             "Antonette",
             "Samantha",
             "Karianne",
             "Kamren",
             "Leopoldo_Corkery",
             "Elwyn.Skiles",
             "Maxime_Nienow",
             "Delphine",
             "Moriah.Stanton"
           ]
  end
end
