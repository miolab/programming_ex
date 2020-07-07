defmodule FibonacciSampleTest do
  use ExUnit.Case
  doctest FibonacciSample

  test "1st number is expected 1" do
    # assert FibonacciSample.nth(1) == 2
    assert FibonacciSample.nth(1) == 1
  end

  test "2nd number is expected 1" do
    # assert FibonacciSample.nth(2) == 2
    assert FibonacciSample.nth(2) == 1
  end

  test "3rd number is expected 2" do
    # assert FibonacciSample.nth(3) == 1
    assert FibonacciSample.nth(3) == 2
  end

  test "4th number is expected 3" do
    # assert FibonacciSample.nth(4) == 2
    assert FibonacciSample.nth(4) == 3
  end

  test "nth number is expected (n-2)+(n-1)" do
    # assert FibonacciSample.nth(5) == 3
    assert FibonacciSample.nth(5) == 5
  end

  test "confirm function by refute" do
    # refute FibonacciSample.nth(6) == 8
    assert FibonacciSample.nth(6) == 8
  end
end
