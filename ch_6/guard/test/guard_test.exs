defmodule GuardTest do
  use ExUnit.Case
  doctest Guard

  test "expected is_number case" do
    assert Guard.what_is(100) == "100 is a Number."
  end

  test "expected is_binary case" do
    assert Guard.what_is("im") == "im is a Binary."
  end

  test "expected is_atom case" do
    assert Guard.what_is(:miolab) == "miolab is a Atom."
  end
end
