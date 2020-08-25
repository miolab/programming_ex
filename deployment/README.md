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

---
