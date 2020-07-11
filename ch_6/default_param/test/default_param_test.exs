defmodule DefaultParamTest do
  use ExUnit.Case
  doctest DefaultParam

  # DefaultParam.filled: default params set [1, 2, 3]
  test "all params to be given" do
    assert DefaultParam.filled(10, 20, 30) == [10, 20, 30]
  end

  test "two params to be given" do
    assert DefaultParam.filled(10, 20) == [10, 20, 3]
  end

  test "one params to be given" do
    assert DefaultParam.filled(10) == [10, 2, 3]
  end

  test "NO param to be given" do
    assert DefaultParam.filled() == [1, 2, 3]
  end

  # DefaultParam.incomplete: default params set [_, 2, _]
  test "next func: all params to be given" do
    assert DefaultParam.incomplete(10, 20, 30) == [10, 20, 30]
  end

  test "next func: two params to be given" do
    assert DefaultParam.incomplete(10, 20) == [10, 2, 20]
  end

  test "next func: (UndefinedFunctionError) one params to be given" do
    assert_raise UndefinedFunctionError, fn -> DefaultParam.incomplete(10) end
  end

  test "next func: (UndefinedFunctionError) NO param to be given" do
    assert_raise UndefinedFunctionError, fn -> DefaultParam.incomplete() end
  end
end
