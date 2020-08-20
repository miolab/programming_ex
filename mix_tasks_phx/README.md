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

- 使い方

  ```
  mix phx.new hoge_hoge
  ```

  - `hoge_hoge` の部分は任意のプロジェクト名を入力

  - オプション

    |              | 説明                               | メモ                               |
    | :----------- | :--------------------------------- | :--------------------------------- |
    | --no-ecto    | Ecto を使わずにプロジェクト作成    | `repo.ex` が生成されなくなる       |
    | --no-webpack | webpack を使わずにプロジェクト作成 | webpack はアセット管理に使用される |

---

## mix phx.gen.html

- HTML リソースを以下のようにフルセットで生成する

  - Ecto マイグレーション
  - Ecto コンテキスト
  - 必要となるアクション一式
  - 必要となるビュー一式
  - テンプレートを持ったコントローラー

- 使い方

  ```
  mix phx.gen.html Blog Post posts body:string word_count:integer
  ```

  - 引数について

    1. Blog ... コンテキストのモジュール名
    1. Post ... スキーマのモジュール名
    1. posts ... リソース名
    1. body:string, word_count:integer ... カラム名と型

  - オプション

    |              | 説明                                                       | メモ                                                 |
    | :----------- | :--------------------------------------------------------- | :--------------------------------------------------- |
    | --no-context | リソースのコンテキストやスキーマを作成せずプロジェクト生成 | パラメーターの`コンテキストモジュール`引数自体は必要 |
    | --no-schema  | リソースのスキーマなしでコンテキストを作成                 | パラメーターの`スキーマ`引数自体は必要               |

#### 実装例

- [phx_hello](https://github.com/miolab/programming_ex/tree/master/phx_hello)

---

## mix phx.gen.json

- JSON リソースを以下のようにフルセットで生成する

  - Ecto マイグレーション
  - Ecto スキーマ
  - 必要となるアクション一式
  - 必要となるビュー一式
  - およびコントローラー

  _NOTE:_ 前述の `mix phx.gen.html` と似てるが、アプリのテンプレートは生成しない

- 使い方

  ```
  mix phx.gen.json Blog Post posts body:string content:string
  ```

  - 引数について

    1. Blog ... コンテキストのモジュール名
    1. Post ... スキーマのモジュール名
    1. posts ... リソース名
    1. body:string, word_count:integer ... カラム名と型

  - オプション

    `mix phx.gen.html` と同様、

    - --no-context
    - --no-schema

    が使用可能

---
