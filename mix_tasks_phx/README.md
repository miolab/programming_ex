# [Mix Tasks of Phoenix](https://hexdocs.pm/phoenix/mix_tasks.html#content)

コマンド例

```terminal
$ mix help | grep -i phx

mix local.phx         # Updates the Phoenix project generator locally
mix phx.new           # Creates a new Phoenix v1.5.4 application
mix phx.new.ecto      # Creates a new Ecto project within an umbrella project
mix phx.new.web       # Creates a new Phoenix web project within an umbrella project
```

---

## mix phx.new

- Phoenix アプリケーション・フレームワークを新規作成する

- 使い方 → `mix phx.new hoge_hoge`

  `hoge_hoge` の部分は任意のプロジェクト名を入力

  | オプション   | 説明                               | メモ                               |
  | :----------- | :--------------------------------- | :--------------------------------- |
  | --no-ecto    | Ecto を使わずにプロジェクト作成    | `repo.ex` が生成されなくなる       |
  | --no-webpack | webpack を使わずにプロジェクト作成 | webpack はアセット管理に使用される |

## mix phx.gen.html

- HTMLリソースを以下のようにフルセットで生成する
  - Ecto マイグレーション
  - Ecto コンテキスト
  - 必要となるアクション一式
  - 必要となるビュー一式
  - テンプレートを持ったコントローラー

- 使い方 → `mix phx.gen.html Blog Post posts body:string word_count:integer`

  - 引数について

    - Blog ... コンテキストのモジュール名
    - Post ... スキーマのモジュール名
    - posts ... リソース名
    - body:string, word_count:integer ... カラム名と型
