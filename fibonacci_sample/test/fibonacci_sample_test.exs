defmodule FibonacciSampleTest do
  use ExUnit.Case
  doctest FibonacciSample

  test "1st number is expected 1" do
    # assert FibonacciSample.nth(1) == 2
    assert FibonacciSample.nth(1) == 1
  end
end
