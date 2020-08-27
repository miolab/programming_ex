# Deployment

Phoenix アプリケーションのデプロイに関するチートシート

- 参考:

# :rocket: [Introduction](https://hexdocs.pm/phoenix/deployment.html#content)

## 事前準備

- PostgreSQL サーバーが起動していることを確認

  ```terminal
  $ pg_ctl status
  pg_ctl: server is running (PID: 12643)
  ```

- Phoenix が開発環境にインストールされていることを確認

  ```elixir
  $ mix archive
  * hex-0.20.5
  * phx_new-1.5.4
  ```

- デプロイ用に Phoenix の mock アプリを作成（[これ](https://hexdocs.pm/phoenix/up_and_running.html)）

  ```elixir
  $ mix phx.new hello  # プロジェクトを作成
    .
    .
  Fetch and install dependencies? [Yn] y
    .
    .

  $ cd hello

  $ mix ecto.create  # データベースを作成
    .
    .

  $ mix phx.server  # ローカルサーバーを起動
    .
    .

  ```

  - Web ブラウザで表示確認

    [http://localhost:4000](http://localhost:4000)

    <img width="796" alt="" src="https://user-images.githubusercontent.com/33124627/88469101-4286e680-cf28-11ea-8c1d-d310bb070873.png">

---

# [ WIP ]

## シークレットデータの取り扱い

```
$ mix phx.gen.secret
xxxxxxxxxxxxxxxxxxxxxxxx

$ export SECRET_KEY_BASE=xxxxxxxxxxxxxxxxxxxxxxxx

$ export DATABASE_URL=ecto://USER:PASS@HOST/database
```

- `config/prod.secret.exs` が、環境変数からシークレットや設定を読み込む

```elixir
$ mix deps.get --only prod

Resolving Hex dependencies...
Dependency resolution completed:
Unchanged:
  connection 1.0.4
  cowboy 2.8.0
  cowlib 2.9.1
  db_connection 2.2.2
  decimal 1.8.1
  ecto 3.4.6
  ecto_sql 3.4.5
  gettext 0.18.1
  jason 1.2.1
  mime 1.4.0
  phoenix 1.5.4
  phoenix_ecto 4.1.0
  phoenix_html 2.14.2
  phoenix_live_dashboard 0.2.7
  phoenix_live_view 0.14.4
  phoenix_pubsub 2.0.0
  plug 1.10.4
  plug_cowboy 2.3.0
  plug_crypto 1.1.2
  postgrex 0.15.5
  ranch 1.7.1
  telemetry 0.4.2
  telemetry_metrics 0.5.0
  telemetry_poller 0.5.1
All dependencies are up to date
```

```elixir
$ MIX_ENV=prod mix compile

==> connection
Compiling 1 file (.ex)
Generated connection app
.
.

Generated hello app

```

```elixir
$ npm run deploy --prefix ./assets

$ mix phx.digest
Check your digested files at "priv/static"

```

```elixir
$ PORT=4001 MIX_ENV=prod mix phx.server
```
