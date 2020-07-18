defmodule CondFizzbuzzTest do
  use ExUnit.Case
  doctest CondFizzbuzz

  test "FizzBuzz by cond" do
    assert CondFizzbuzz.upto(15) == [
             1,
             2,
             "Fizz",
             4,
             "Buzz",
             "Fizz",
             7,
             8,
             "Fizz",
             "Buzz",
             11,
             "Fizz",
             13,
             14,
             "FizzBuzz"
           ]
  end
end

defmodule PatternMatchFizzbuzzTest do
  use ExUnit.Case
  doctest PatternMatchFizzbuzz

  test "FizzBuzz by pattern match" do
    assert PatternMatchFizzbuzz.upto(15) ==
             [
               1,
               2,
               "Fizz",
               4,
               "Buzz",
               "Fizz",
               7,
               8,
               "Fizz",
               "Buzz",
               11,
               "Fizz",
               13,
               14,
               "FizzBuzz"
             ]
  end
end
