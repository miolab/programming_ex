# [Mix Tasks](https://hexdocs.pm/phoenix/mix_tasks.html#content)

`mix` コマンドについてのチートシート

<div style="height: 40px;"></div>

# Phoenix 関係

- コマンド例

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
    2. Post ... スキーマのモジュール名
    3. posts ... リソース名
    4. body:string, word_count:integer ... カラム名と型

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
    2. Post ... スキーマのモジュール名
    3. posts ... リソース名
    4. body:string, content:string ... カラム名と型

  - オプション

    `mix phx.gen.html` と同様、

    - --no-context
    - --no-schema

    が使用可能

---

## mix phx.gen.context

- HTML/JSON リソースのフルセットまでは必要ない場合で、コンテキスト作成を目的とするケースで使用（以下を生成）

  - コンテキスト
  - スキーマ
  - マイグレーション
  - テストケース

- 使い方

  ```
  mix phx.gen.context Accounts User users name:string age:integer
  ```

  - 引数について

    1. Accounts ... コンテキストのモジュール名
    2. User ... スキーマのモジュール名
    3. users ... リソース名
    4. name:string, age:integer ... カラム名と型

#### 実装例

- [phx_hello](https://github.com/miolab/programming_ex/tree/master/phx_hello)

---

## mix phx.gen.schema

- HTML/JSON リソースのフルセットまでは必要なく、コンテキスト作成も必要ないケースで、スキーマとマイグレーションの生成をしたいケースで使用（以下を生成）

- 使い方

  ```
  mix phx.gen.schema Accounts.Credential credentials email:string:unique user_id:references:users
  ```

  - 引数について

    1. Accounts.Credential ... スキーマのモジュール名（名前空間を持つこともできる）
    2. credentials ... リソース名
    3. email:string:unique user_id:references:users ... カラム名と型

---

## mix phx.gen.channel

- （まだ使ったことはない）

---

## mix phx.gen.presence

- （まだ使ったことはない）

---

## mix phx.routes

- ルーターで定義したルートをすべて表示する

- 例

  ```elixir
  $ mix phx.routes

            page_path  GET  /                                      PhxHelloWeb.PageController :index
          hello_path  GET  /hello                                 PhxHelloWeb.HelloController :index
  live_dashboard_path  GET  /dashboard                             Phoenix.LiveView.Plug :home
  live_dashboard_path  GET  /dashboard/:node/home                  Phoenix.LiveView.Plug :home
  live_dashboard_path  GET  /dashboard/:node/os_mon                Phoenix.LiveView.Plug :os_mon
  live_dashboard_path  GET  /dashboard/:node/metrics               Phoenix.LiveView.Plug :metrics
  live_dashboard_path  GET  /dashboard/:node/applications          Phoenix.LiveView.Plug :applications
  live_dashboard_path  GET  /dashboard/:node/processes             Phoenix.LiveView.Plug :processes
  live_dashboard_path  GET  /dashboard/:node/ports                 Phoenix.LiveView.Plug :ports
  live_dashboard_path  GET  /dashboard/:node/sockets               Phoenix.LiveView.Plug :sockets
  live_dashboard_path  GET  /dashboard/:node/ets                   Phoenix.LiveView.Plug :ets
  live_dashboard_path  GET  /dashboard/:node/request_logger        Phoenix.LiveView.Plug :request_logger
  live_dashboard_path  GET  /dashboard/:node/:page                 Phoenix.LiveView.Plug :page
            websocket  WS   /live/websocket                        Phoenix.LiveView.Socket
            longpoll  GET  /live/longpoll                         Phoenix.LiveView.Socket
            longpoll  POST  /live/longpoll                         Phoenix.LiveView.Socket
            websocket  WS   /socket/websocket                      PhxHelloWeb.UserSocket
  ```

  - [phx_hello](https://github.com/miolab/programming_ex/tree/master/phx_hello) より抜粋

---

## mix phx.server

- アプリケーションサーバーを起動

---

## mix phx.digest

- （まだ使ったことはない）

---

<div style="height: 40px;"></div>

# Ecto 関係

---

---