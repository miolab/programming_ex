defmodule ComprehensionTest do
  use ExUnit.Case
  doctest Comprehension

  @arr [1, 2, 3, 4, 5, 6]

  test "square params: all" do
    assert @arr |> Comprehension.square() == @arr |> Enum.map(&(&1 * &1))
  end

  test "square params: first to three" do
    arr_1 = @arr |> Comprehension.square_limit_three()
    arr_2 = @arr |> Enum.take(3) |> Enum.map(&(&1 * &1))

    assert arr_1 == arr_2
  end
end
