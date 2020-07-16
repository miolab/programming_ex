defmodule BinariesTest do
  use ExUnit.Case
  doctest Binaries

  # given binary is <<1, 2, 3, 4>>
  test "check byte", do: assert(Binaries.byte_check() == 4)
  test "check bit", do: assert(Binaries.bit_check() == 32)
end
