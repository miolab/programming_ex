# CsvWeather

[気象庁CSVデータ](https://www.data.jma.go.jp/obd/stats/data/mdrr/docs/csv_dl_format_predaily.html) を、__Elixir__ で扱ってみる

---

## 実装（`iex` 実行）

- CSV準備

  ```terminal
  $ wget https://www.data.jma.go.jp/obd/stats/data/mdrr/pre_rct/alltable/predaily00_rct.csv
  ```

  - 上記でDLしてきたCSVファイルを、下記 `mix new hoge` で作成したプロジェクトディレクトリに保存

- プロジェクト作成

  ```elixir
  $ mix new csv_weather

  * creating README.md
  * creating .formatter.exs
  * creating .gitignore
  * creating mix.exs
  * creating lib
  * creating lib/csv_weather.ex
  * creating test
  * creating test/test_helper.exs
  * creating test/csv_weather_test.exs

  Your Mix project was created successfully.
  You can use "mix" to compile it, test it, and more:

      cd csv_weather
      mix test

  Run "mix help" for more commands.

  ```

  ```terminal
  $ cd csv_weather
  ```

- `mix.exs` に、[CSV](https://hex.pm/packages/csv) ライブラリ追加

  ```elixir
  # Run "mix help deps" to learn about dependencies.
    defp deps do
      [
        {:csv, "~> 2.3"}    # --> add
        # {:dep_from_hexpm, "~> 0.3.0"},
        # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      ]
  ```
- `mix deps.get` して、`iex` で実行

  ```elixir
  $ mix deps.get
  ```

  ```terminal
  $ iex- S mix
  ```

  ```elixir
  iex> File.stream!("data_utf8.csv") |> CSV.decode! |> Enum.to_list

  [
    ok: ["観測所番号", "都道府県", "地点", "国際地点番号",
    "現在時刻(年)", "現在時刻(月)", "現在時刻(日)",
    "現在時刻(時)", "現在時刻(分)", "今日の値(mm)",
    "今日の値の品質情報", "極値更新",
    "10年未満での極値更新", "昨日までの観測史上1位の値(mm)",
    "昨日までの観測史上1位の値の品質情報",
    "昨日までの観測史上1位の値の年",
    "昨日までの観測史上1位の値の月",
    "昨日までの観測史上1位の値の日",
    "昨日までの8月の1位の値(mm)",
    "昨日までの8月の1位の値の品質情報",
    "昨日までの8月の1位の値の年",
    "昨日までの8月の1位の値の月",
    "昨日までの8月の1位の値の日", "統計開始年"],
    ok: ["11001", "北海道 宗谷地方", "宗谷岬（ソウヤミサキ）",
    "", "2020", "08", "01", "13", "00", "0.0", "4", "", "", "141.5", "8", "2016",
    "09", "06", "116", "8", "1997", "08", "07", "1978"],
    ok: ["11016", "北海道 宗谷地方", "稚内（ワッカナイ）",
    "47401", "2020", "08", "01", "13", "00", "0.0", "4", "", "", "192.0", "8",
    "2016", "09", "06", "138.1", "8", "1955", "08", "29", "1938"],
    ok: ["11046", "北海道 宗谷地方", "礼文（レブン）", "", "2020",
    "08", "01", "13", "00", "0.0", "4", "", "", "160.0", "8", "2014", "08", "24",
    "160.0", "8", "2014", "08", "24", "2003"],
      .
      .
      .
  ]
  ```

- カラムを1列指定してリスト化

  ```elixir
  iex> File.stream!("data_utf8.csv") |> CSV.decode! |> Enum.to_list |> Enum.map(&Enum.at(&1, 0))

  ["観測所番号", "11001", "11016", "11046", "11061", "11076", "11091",
  "11121", "11151", "11176", "11206", "11276", "11291", "11316", "13011",
  "12011", "12041", "12066", "12141", "12181", "12217", "12231", "12256",
  "12261", "12266", "12301", "12386", "12396", "12411", "12442", "12451",
  "12457", "12471", "12501", "12512", "12551", "12596", "12607", "12626",
  "12632", "12686", "12691", "12746", "15041", "15076", "13061", "13086",
  "13121", "13146", "13181", ...]
    ```

- マップ



---

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `csv_weather` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:csv_weather, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/csv_weather](https://hexdocs.pm/csv_weather).

