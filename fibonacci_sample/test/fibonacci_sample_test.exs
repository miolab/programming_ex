defmodule FibonacciSampleTest do
  use ExUnit.Case
  doctest FibonacciSample

  test "greets the world" do
    assert FibonacciSample.hello() == :world
  end
end
