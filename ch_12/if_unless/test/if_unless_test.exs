defmodule IfUnlessTest do
  use ExUnit.Case
  doctest IfUnless

  test "if" do
    assert IfUnless.judge_int_1_if(1) == "true"
    assert IfUnless.judge_int_1_if(2) == "false"
  end

  test "unless" do
    assert IfUnless.judge_int_1_unless(1) == "mutch: ok"
    assert IfUnless.judge_int_1_unless(2) == "not mutch: error"
  end
end
