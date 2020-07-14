# Infinity

**1 億個（100_000_000）** の要素を持つリストに対して、各要素に処理を施し、最初の 5 要素を取り出す関数を提供する。  
また、各 def 関数の **実行時間** を計測し、比較する。

- 計測結果

  - Enum

    ```erlang
    iex> :timer.tc Infinity, :enum_pipeline, []
    [2, 3, 4, 5, 6]
    {20460421, [2, 3, 4, 5, 6]}
    ```

    - ≒ 20460.0 [ms]

  - Stream

    ```erlang
    iex> :timer.tc Infinity, :stream_pipeline, []
    [2, 3, 4, 5, 6]
    {289, [2, 3, 4, 5, 6]}
    ```

    - ≒ 0.3 [ms]

---

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `infinity` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:infinity, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/infinity](https://hexdocs.pm/infinity).
