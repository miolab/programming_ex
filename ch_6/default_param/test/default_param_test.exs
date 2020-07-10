defmodule DefaultParamTest do
  use ExUnit.Case
  doctest DefaultParam

  # DefaultParam.filled: init set [1, 2, 3]
  test "if params to be not given" do
    assert DefaultParam.filled() == [1, 2, 3]
  end
end
