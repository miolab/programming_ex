defmodule CsvWeatherTest do
  use ExUnit.Case
  doctest CsvWeather

  test "greets the world" do
    assert CsvWeather.hello() == :world
  end
end
