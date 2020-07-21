defmodule CliTest do
  use ExUnit.Case
  doctest Issues

  import Issues.CLI, only: [parse_args: 1]

  test ":help returned by option parsing with -h and --help options" do
    assert parse_args(["-h", "anything"]) == :help
    assert parse_args(["-help", "anything"]) == :help
  end

  test "three values returned if three given" do
    assert parse_args(["im", "foo_project", "99"]) == {"im", "foo_project", 99}
  end

  test "count is defaulted if two values given" do
    assert parse_args(["im", "foo_project"]) == {"im", "foo_project", 4}
  end
end
