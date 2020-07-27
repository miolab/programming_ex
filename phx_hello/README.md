# PhxHello

Phoenix

- [Official](https://phoenixframework.org/)

- [GitHub](https://github.com/phoenixframework/phoenix)

## [Installation](https://hexdocs.pm/phoenix/installation.html)

- 事前準備: PostgreSQL サーバー起動

  ```elixir
  $ pg_ctl start
  ```

- Phoenix インストール（e.g. ver 1.5.4）

  ```elixir
  $ mix archive.install hex phx_new 1.5.4

  Resolving Hex dependencies...
  Dependency resolution completed:
  New:
    phx_new 1.5.4
  * Getting phx_new (Hex package)
  All dependencies are up to date
  Compiling 10 files (.ex)
  Generated phx_new app
  Generated archive "phx_new-1.5.4.ez" with MIX_ENV=prod
  Are you sure you want to install "phx_new-1.5.4.ez"? [Yn] y
  * creating /Users/im/.asdf/installs/elixir/1.10.3-otp-22/.mix/archives/phx_new-1.5.4
  ```

  - バージョン確認

    ```elixir
    $ mix archive
    * hex-0.20.5
    * phx_new-1.5.4
    ```

## [Up and Running](https://hexdocs.pm/phoenix/up_and_running.html#content)

### Up

- プロジェクト作成

  ```elixir
  $ mix phx.new phx_hello

  * creating phx_hello/config/config.exs
  * creating phx_hello/config/dev.exs
  * creating phx_hello/config/prod.exs
  * creating phx_hello/config/prod.secret.exs
  * creating phx_hello/config/test.exs
  * creating phx_hello/lib/phx_hello/application.ex
  * creating phx_hello/lib/phx_hello.ex
  * creating phx_hello/lib/phx_hello_web/channels/user_socket.ex
  * creating phx_hello/lib/phx_hello_web/views/error_helpers.ex
  * creating phx_hello/lib/phx_hello_web/views/error_view.ex
  * creating phx_hello/lib/phx_hello_web/endpoint.ex
  * creating phx_hello/lib/phx_hello_web/router.ex
  * creating phx_hello/lib/phx_hello_web/telemetry.ex
  * creating phx_hello/lib/phx_hello_web.ex
  * creating phx_hello/mix.exs
  * creating phx_hello/README.md
  * creating phx_hello/.formatter.exs
  * creating phx_hello/.gitignore
  * creating phx_hello/test/support/channel_case.ex
  * creating phx_hello/test/support/conn_case.ex
  * creating phx_hello/test/test_helper.exs
  * creating phx_hello/test/phx_hello_web/views/error_view_test.exs
  * creating phx_hello/lib/phx_hello/repo.ex
  * creating phx_hello/priv/repo/migrations/.formatter.exs
  * creating phx_hello/priv/repo/seeds.exs
  * creating phx_hello/test/support/data_case.ex
  * creating phx_hello/lib/phx_hello_web/controllers/page_controller.ex
  * creating phx_hello/lib/phx_hello_web/templates/layout/app.html.eex
  * creating phx_hello/lib/phx_hello_web/templates/page/index.html.eex
  * creating phx_hello/lib/phx_hello_web/views/layout_view.ex
  * creating phx_hello/lib/phx_hello_web/views/page_view.ex
  * creating phx_hello/test/phx_hello_web/controllers/page_controller_test.exs
  * creating phx_hello/test/phx_hello_web/views/layout_view_test.exs
  * creating phx_hello/test/phx_hello_web/views/page_view_test.exs
  * creating phx_hello/lib/phx_hello_web/gettext.ex
  * creating phx_hello/priv/gettext/en/LC_MESSAGES/errors.po
  * creating phx_hello/priv/gettext/errors.pot
  * creating phx_hello/assets/webpack.config.js
  * creating phx_hello/assets/.babelrc
  * creating phx_hello/assets/js/app.js
  * creating phx_hello/assets/css/app.scss
  * creating phx_hello/assets/js/socket.js
  * creating phx_hello/assets/package.json
  * creating phx_hello/assets/static/favicon.ico
  * creating phx_hello/assets/css/phoenix.css
  * creating phx_hello/assets/static/images/phoenix.png
  * creating phx_hello/assets/static/robots.txt

  Fetch and install dependencies? [Yn] y
  * running mix deps.get
  * running mix deps.compile
  * running cd assets && npm install && node node_modules/webpack/bin/webpack.js --mode development

  We are almost there! The following steps are missing:

      $ cd phx_hello

  Then configure your database in config/dev.exs and run:

      $ mix ecto.create

  Start your Phoenix app with:

      $ mix phx.server

  You can also run your app inside IEx (Interactive Elixir) as:

      $ iex -S mix phx.server
  ```

  ```elixir
  $ cd phx_hello/
  ```

  ```elixir
  $ mix ecto.create

  Compiling 14 files (.ex)
  Generated phx_hello app
  The database for PhxHello.Repo has been created
  ```

### Run

- サーバー起動

  ```elixir
  $ mix phx.server
  ```

  - Phoenix Framework welcome page [http://localhost:4000](http://localhost:4000)

    <img width="796" alt="" src="https://user-images.githubusercontent.com/33124627/88469101-4286e680-cf28-11ea-8c1d-d310bb070873.png">

  - Phoenix LiveDashboard [http://localhost:4000/dashboard](http://localhost:4000/dashboard)

    <img width="1149" alt="" src="https://user-images.githubusercontent.com/33124627/88469130-bfb25b80-cf28-11ea-9971-393c0cc06a50.png">

## [Request life-cycle](https://hexdocs.pm/phoenix/request_lifecycle.html#content)

## [Directory structure](https://hexdocs.pm/phoenix/directory_structure.html)

- ルートの追加

lib/phx_hello_web/router.ex

---

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Install Node.js dependencies with `npm install` inside the `assets` directory
- Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

- Official website: https://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Forum: https://elixirforum.com/c/phoenix-forum
- Source: https://github.com/phoenixframework/phoenix
