# PhxHello

Phoenix

- [Official](https://phoenixframework.org/)

- [GitHub](https://github.com/phoenixframework/phoenix)

## :computer: [Installation](https://hexdocs.pm/phoenix/installation.html)

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

## :computer: [Up and Running](https://hexdocs.pm/phoenix/up_and_running.html#content)

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

---

## :computer: [Directory structure](https://hexdocs.pm/phoenix/directory_structure.html)

---

## :computer: [Request life-cycle](https://hexdocs.pm/phoenix/request_lifecycle.html#content)

ルート `/hello` を準備し、エンドポイント `http://localhost:4000/hello` を作成する。

### __ルート__ の追加

- `lib/phx_hello_web/router.ex` を、以下のように修正

  ```elixir
  scope "/", PhxHelloWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/hello", HelloController, :index    # -> add
  end
  ```

### __コントローラ__ の作成

- `lib/phx_hello_web/controllers/hello_controller.ex` を、以下内容で新規作成

  ```elixir
  defmodule PhxHelloWeb.HelloController do
    use PhxHelloWeb, :controller

    def index(conn, _params) do
      render(conn, "index.html")
    end
  end
  ```

### __ビュー__ の作成

- `lib/phx_hello_web/views/hello_view.ex` を、以下内容で新規作成

  ```elixir
  defmodule PhxHelloWeb.HelloView do
    use PhxHelloWeb, :view
  end
  ```

### __テンプレート__ の作成

- `lib/phx_hello_web/templates/hello/index.html.eex` を、以下内容で新規作成

  ```html
  <section class="phx-hero">
    <h2>Hello, im!</h2>
  </section>
  ```

- サーバーを `ctrl + c` で停止して、ふたたび `mix phx.server` で起動

  - [http://localhost:4000/hello](http://localhost:4000)

    <img width="823" alt="" src="https://user-images.githubusercontent.com/33124627/88653950-b206fc80-d107-11ea-870a-9bb09191745b.png">

- ルーティングを確認

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

  - `/hello` でルートが作成されていることが確認できました↓↓↓

    ```
    hello_path  GET  /hello                                 PhxHelloWeb.HelloController :index
    ```

---

### __新エンドポイントを別途追加__

1. ルート `/hello/:messenger` を準備し、エンドポイント `http://localhost:4000/hello/:messenger` を作成する。

1. 上記 `:messenger` 部分を任意の名前に置き換えて、画面に名前を表示反映する

- `router.ex` に、新ルートを追記

  ```elixir
  scope "/", PhxHelloWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show    # -> add
  end
  ```

- `hello_controller.ex` コントローラに、新アクションを追記

  ```elixir
  defmodule PhxHelloWeb.HelloController do
    use PhxHelloWeb, :controller

    def index(conn, _params) do
      render(conn, "index.html")
    end

    # add next def ~ end
    def show(conn, %{"messenger" => messenger}) do
      render(conn, "show.html", messenger: messenger)
    end
  end
  ```

- `lib/phx_hello_web/templates/hello/show.html.eex` テンプレートを、以下内容で新規作成

  ```html
  <section class="phx-hero">
    <h2>Hello im, from messenger <%= @messenger %>!</h2>
  </section>
  ```

- [`http://localhost:4000/hello/miolab`](http://localhost:4000/hello/miolab) を確認

  <img width="709" alt="" src="https://user-images.githubusercontent.com/33124627/88742821-254b5580-d17e-11ea-9897-89ca308b63fd.png">

- ルーティングを確認

  ```elixir
  $ mix phx.routes

            page_path  GET  /                                      PhxHelloWeb.PageController :index
          hello_path  GET  /hello                                 PhxHelloWeb.HelloController :index
          hello_path  GET  /hello/:messenger                      PhxHelloWeb.HelloController :show
  live_dashboard_path  GET  /dashboard                             Phoenix.LiveView.Plug :home
  live_dashboard_path  GET  /dashboard/:node/home                  Phoenix.LiveView.Plug :home
      .
      .
  ```

  - `/hello/:messenger` でルートが作成されていることが確認できました↓↓↓

    ```
    hello_path  GET  /hello/:messenger                      PhxHelloWeb.HelloController :show
    ```

---

## :computer: [Plug](https://hexdocs.pm/phoenix/plug.html#content)

---

## :computer: [Routing](https://hexdocs.pm/phoenix/routing.html#content)

---

## :computer: [Controllers](https://hexdocs.pm/phoenix/controllers.html#content)

---

## :computer: [Views and templates](https://hexdocs.pm/phoenix/views.html#content)

---

## :computer: [Ecto](https://hexdocs.pm/phoenix/ecto.html#content)

### デフォルトのDB接続設定を確認

- `config/dev.exs`

  ```elixir
  use Mix.Config

  # Configure your database
  config :phx_hello, PhxHello.Repo,
    username: "postgres",
    password: "postgres",
    database: "phx_hello_dev",
    hostname: "localhost",
    show_sensitive_data_on_connection_error: true,
    pool_size: 10

  # For development, we disable any cache and enable
  # debugging and code reloading.
  #
  # The watchers configuration can be used to run external
  # watchers to your application. For example, we use it
  # with webpack to recompile .js and .css sources.
  config :phx_hello, PhxHelloWeb.Endpoint,
    http: [port: 4000],
    debug_errors: true,
    code_reloader: true,
    check_origin: false,
      .
      .
      .
  ```

### スキーマ作成 ~ マイグレーション実行

- `phx.gen.schema` タスクを使い、`User` という名前で __Ectoスキーマ__ を生成します

  ```elixir
  $ mix phx.gen.schema User users name:string email:string bio:string number_of_pets:integer

  * creating lib/phx_hello/user.ex
  * creating priv/repo/migrations/20200730001324_create_users.exs

  Remember to update your repository by running migrations:

      $ mix ecto.migrate

  ```

- __マイグレーション__ 実行

  ```terminal
  $ mix ecto.migrate

  Compiling 1 file (.ex)
  Generated phx_hello app

  09:17:46.404 [info]  == Running 20200730001324 PhxHello.Repo.Migrations.CreateUsers.change/0 forward

  09:17:46.406 [info]  create table users

  09:17:46.449 [info]  == Migrated 20200730001324 in 0.0s
  ```

  - これにより、`priv/repo/migrations/20200730001324_create_users.exs` マイグレーションファイルが、以下内容で生成されました

    ```elixir
    defmodule PhxHello.Repo.Migrations.CreateUsers do
      use Ecto.Migration

      def change do
        create table(:users) do
          add :name, :string
          add :email, :string
          add :bio, :string
          add :number_of_pets, :integer

          timestamps()
        end

      end
    end
    ```

- PostgreSQL側でDBテーブルを確認

  ```postgres
  $ psql -l
                                      List of databases
          Name         |  Owner   | Encoding |   Collate   |    Ctype    | Access privileges 
  ----------------------+----------+----------+-------------+-------------+-------------------
    .
    .
  phx_hello_dev        | postgres | UTF8     | ja_JP.UTF-8 | ja_JP.UTF-8 | 
  postgres             | im       | UTF8     | ja_JP.UTF-8 | ja_JP.UTF-8 | 
    .
    .
  (13 rows)
  ```

  ```postgres
  $ psql phx_hello_dev
  psql (12.2)
  Type "help" for help.
  ```

  ```postgres
  phx_hello_dev=# \d
                  List of relations
  Schema |       Name        |   Type   |  Owner   
  --------+-------------------+----------+----------
  public | schema_migrations | table    | postgres
  public | users             | table    | postgres
  public | users_id_seq      | sequence | postgres
  (3 rows)
  ```

  ```postgres
  phx_hello_dev=# \d users
                                              Table "public.users"
      Column     |              Type              | Collation | Nullable |              Default              
  ----------------+--------------------------------+-----------+----------+-----------------------------------
  id             | bigint                         |           | not null | nextval('users_id_seq'::regclass)
  name           | character varying(255)         |           |          | 
  email          | character varying(255)         |           |          | 
  bio            | character varying(255)         |           |          | 
  number_of_pets | integer                        |           |          | 
  inserted_at    | timestamp(0) without time zone |           | not null | 
  updated_at     | timestamp(0) without time zone |           | not null | 
  Indexes:
      "users_pkey" PRIMARY KEY, btree (id)
  ```

    - ↑ の通り、`$ mix phx.gen.schema6 User users name:string email:string bio:string number_of_pets:integer` で指定したカラムが作成されています

    - 下記 `lib/phx_hello/user.ex` と比較確認

      ```elixir
      defmodule PhxHello.User do
        use Ecto.Schema
        import Ecto.Changeset

        schema "users" do
          field :bio, :string
          field :email, :string
          field :name, :string
          field :number_of_pets, :integer

          timestamps()
        end

        @doc false
        def changeset(user, attrs) do
          user
          |> cast(attrs, [:name, :email, :bio, :number_of_pets])
          |> validate_required([:name, :email, :bio, :number_of_pets])
        end
      end
      ```

  ```postgres
  phx_hello_dev=# \q
  ```

---

## :computer: [Contexts](https://hexdocs.pm/phoenix/contexts.html#content)

### 事前準備

- 前回つくったuserスキーマを削除

  ```terminal
  $ rm lib/phx_hello/user.ex

  $ rm priv/repo/migrations/20200730001324_create_users.exs
  ```

- データベースをリセットする

  `phx.server` を停止させてから、

  ```elixir
  $ mix ecto.reset

  The database for PhxHello.Repo has been dropped
  The database for PhxHello.Repo has been created

  13:16:49.825 [info]  Already up
  ```

### `Accounts` コンテキストを作成

- `mix phx.gen.html`

  アカウントコンテキストを作成

  ```elixir

  $ mix phx.gen.html Accounts User users name:string username:string:unique

  * creating lib/phx_hello_web/controllers/user_controller.ex
  * creating lib/phx_hello_web/templates/user/edit.html.eex
  * creating lib/phx_hello_web/templates/user/form.html.eex
  * creating lib/phx_hello_web/templates/user/index.html.eex
  * creating lib/phx_hello_web/templates/user/new.html.eex
  * creating lib/phx_hello_web/templates/user/show.html.eex
  * creating lib/phx_hello_web/views/user_view.ex
  * creating test/phx_hello_web/controllers/user_controller_test.exs
  * creating lib/phx_hello/accounts/user.ex
  * creating priv/repo/migrations/20200731101202_create_users.exs
  * creating lib/phx_hello/accounts.ex
  * injecting lib/phx_hello/accounts.ex
  * creating test/phx_hello/accounts_test.exs
  * injecting test/phx_hello/accounts_test.exs

  Add the resource to your browser scope in lib/phx_hello_web/router.ex:

      resources "/users", UserController


  Remember to update your repository by running migrations:

      $ mix ecto.migrate

  ```

- `lib/phx_hello_web/router.ex`

  コンソール出力メッセージにしたがい、以下のように修正

  ```elixir
  scope "/", PhxHelloWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show

    resources "/users", UserController    # -> add
  end
  ```

- マイグレーション

  ```elixir
  $ mix ecto.migrate

  Compiling 5 files (.ex)
  Generated phx_hello app

  19:15:44.767 [info]  == Running 20200731101202 PhxHello.Repo.Migrations.CreateUsers.change/0 forward

  19:15:44.769 [info]  create table users

  19:15:44.786 [info]  create index users_username_index

  19:15:44.790 [info]  == Migrated 20200731101202 in 0.0s
  ```

- ルーティングを確認

  ```elixir
  $ mix phx.routes

            page_path  GET     /                                      PhxHelloWeb.PageController :index
          hello_path  GET     /hello                                 PhxHelloWeb.HelloController :index
          hello_path  GET     /hello/:messenger                      PhxHelloWeb.HelloController :show
            user_path  GET     /users                                 PhxHelloWeb.UserController :index
            user_path  GET     /users/:id/edit                        PhxHelloWeb.UserController :edit
            user_path  GET     /users/new                             PhxHelloWeb.UserController :new
            user_path  GET     /users/:id                             PhxHelloWeb.UserController :show
            user_path  POST    /users                                 PhxHelloWeb.UserController :create
            user_path  PATCH   /users/:id                             PhxHelloWeb.UserController :update
                      PUT     /users/:id                             PhxHelloWeb.UserController :update
            user_path  DELETE  /users/:id                             PhxHelloWeb.UserController :delete
  live_dashboard_path  GET     /dashboard                             Phoenix.LiveView.Plug :home
      .
      .
      .
  ```

  - `/users` パスが生成されていることが確認できました

- サーバー起動し、[http://localhost:4000/users](http://localhost:4000/users) を確認

  ![スクリーンショット 2020-07-31 19 34 46](https://user-images.githubusercontent.com/33124627/89027144-f6db9f00-d364-11ea-9b8a-dc0ca9367572.png)

- `New User` をクリック

  ![スクリーンショット 2020-07-31 19 41 00](https://user-images.githubusercontent.com/33124627/89027635-cb0ce900-d365-11ea-93ce-c1fa7f7f8dc6.png)

  - 未入力のまま `SAVE` クリックすると、きちんとエラーになる

    ![スクリーンショット 2020-07-31 19 43 11](https://user-images.githubusercontent.com/33124627/89028027-859ceb80-d366-11ea-981c-59fd8b1a1358.png)

- `Name` を _im miolab_、`Username` を _im_ と入力して、`SAVE` クリック

  ![スクリーンショット 2020-07-31 19 44 08](https://user-images.githubusercontent.com/33124627/89028049-9188ad80-d366-11ea-99ce-fa74acc08adf.png)

  - user登録されました

- 何名かをあらたに `New User` 登録したら、  
  `Back` で `http://localhost:4000/users` に戻り、一覧を確認します

  ![スクリーンショット 2020-07-31 19 57 22](https://user-images.githubusercontent.com/33124627/89028964-54251f80-d368-11ea-9421-6674c89d085c.png)

  - `Show`、`Edit`、`Delete` もそろっており、基本的な __CRUD__ 操作が可能です

---

### `phx.gen.html` コマンド補足（生成コントローラ）

- 生成されたコントローラ `lib/phx_hello_web/controllers/user_controller.ex` の内容を確認してみます

  ```elixir
  defmodule PhxHelloWeb.UserController do
    use PhxHelloWeb, :controller

    alias PhxHello.Accounts
    alias PhxHello.Accounts.User

    def index(conn, _params) do
      users = Accounts.list_users()
      render(conn, "index.html", users: users)
    end

    def new(conn, _params) do
      changeset = Accounts.change_user(%User{})
      render(conn, "new.html", changeset: changeset)
    end

    def create(conn, %{"user" => user_params}) do
      case Accounts.create_user(user_params) do
        {:ok, user} ->
          conn
          |> put_flash(:info, "User created successfully.")
          |> redirect(to: Routes.user_path(conn, :show, user))

        {:error, %Ecto.Changeset{} = changeset} ->
          render(conn, "new.html", changeset: changeset)
      end
    end

    def show(conn, %{"id" => id}) do
      user = Accounts.get_user!(id)
      render(conn, "show.html", user: user)
    end

    def edit(conn, %{"id" => id}) do
      user = Accounts.get_user!(id)
      changeset = Accounts.change_user(user)
      render(conn, "edit.html", user: user, changeset: changeset)
    end

    def update(conn, %{"id" => id, "user" => user_params}) do
      user = Accounts.get_user!(id)

      case Accounts.update_user(user, user_params) do
        {:ok, user} ->
          conn
          |> put_flash(:info, "User updated successfully.")
          |> redirect(to: Routes.user_path(conn, :show, user))

        {:error, %Ecto.Changeset{} = changeset} ->
          render(conn, "edit.html", user: user, changeset: changeset)
      end
    end

    def delete(conn, %{"id" => id}) do
      user = Accounts.get_user!(id)
      {:ok, _user} = Accounts.delete_user(user)

      conn
      |> put_flash(:info, "User deleted successfully.")
      |> redirect(to: Routes.user_path(conn, :index))
    end
  end
  ```

  - `put_flash` で UI操作での成功メッセージ表示をしています

  - こちらの部分で、表示メッセージ内容を変更可能

    ```elixir
      |> put_flash(:info, "オーケー！ User updated successfully.")
    ```

    <img width="631" alt="" src="https://user-images.githubusercontent.com/33124627/89092251-0a314d80-d3eb-11ea-9e29-122ece07efbc.png">

---

### コンテキスト内の関連付け（クレデンシャル）

- クレデンシャル設定

  ```elixir
  $ mix phx.gen.context Accounts Credential credentials email:string:unique user_id:references:users

  You are generating into an existing context.

  The PhxHello.Accounts context currently has 6 functions and 1 files in its directory.

    * It's OK to have multiple resources in the same context as long as they are closely related. But if a context grows too large, consider breaking it apart

    * If they are not closely related, another context probably works better

  The fact two entities are related in the database does not mean they belong to the same context.

  If you are not sure, prefer creating a new context over adding to the existing one.

  Would you like to proceed? [Yn] y
  * creating lib/phx_hello/accounts/credential.ex
  * creating priv/repo/migrations/20200803101847_create_credentials.exs
  * injecting lib/phx_hello/accounts.ex
  * injecting test/phx_hello/accounts_test.exs

  Remember to update your repository by running migrations:

      $ mix ecto.migrate

  ```

  - `$ mix phx.gen.context` は、`$ mix phx.gen.html` と異なり、Webファイルを生成しない

  - 最初の `$ mix phx.gen.html` で、すでにコントローラとテンプレートを作成済みであるため、ここから `$ mix phx.gen.context` でクレデンシャル機能を追加する方針

- `priv/repo/migrations/20200803101847_create_credentials.exs`

  内容を一部変更し、__親ユーザーの削除時にユーザーのクレデンシャルも削除__ されるよう修正

  ```elixir
  defmodule PhxHello.Repo.Migrations.CreateCredentials do
    use Ecto.Migration

    def change do
      create table(:credentials) do
        add :email, :string
        add :user_id, references(:users, on_delete: :delete_all), null: false    # -> update

    .
    .
  ```

  - `null: false` は、既存ユーザーがない場合にクレデンシャルを生成できないようにする制約

- マイグレーション

  ```elixir
  $ mix ecto.migrate

  Compiling 2 files (.ex)
  Generated phx_hello app

  19:33:01.385 [info]  == Running 20200803101847 PhxHello.Repo.Migrations.CreateCredentials.change/0 forward

  19:33:01.387 [info]  create table credentials

  19:33:01.431 [info]  create index credentials_email_index

  19:33:01.433 [info]  create index credentials_user_id_index

  19:33:01.436 [info]  == Migrated 20200803101847 in 0.0s
  ```

- `lib/phx_hello/accounts/user.ex`

  Accountsコンテキストに対し、__ユーザーとクレデンシャルの関連付け方__ をわたす

  ```elixir
  defmodule PhxHello.Accounts.User do
    use Ecto.Schema
    import Ecto.Changeset

    alias PhxHello.Accounts.Credential    # -> add

    schema "users" do
      field :name, :string
      field :username, :string
      has_one :credential, Credential    # -> add

      timestamps()
    end
  ```

  - `has_one` で、リレーションの親である _users_ と、子のクレデンシャルの関連付け方をEctoに渡しました

- `accounts/credential.ex`

  先ほどの実装と対となる関連付けを追加

  ```elixir
  defmodule PhxHello.Accounts.Credential do
    use Ecto.Schema
    import Ecto.Changeset

    alias PhxHello.Accounts.User    # -> add

    schema "credentials" do
      field :email, :string
      # field :user_id, :id    # -> delete
      belongs_to :user, User    # -> add

      timestamps()
    end
  ```

  - `belongs_to` で、子リレーションを親である _User_ にマッピングしました

- `lib/phx_hello/accounts.ex`

  ```elixir
  defmodule PhxHello.Accounts do
    @moduledoc """
    The Accounts context.
    """

    import Ecto.Query, warn: false
    alias PhxHello.Repo

    alias PhxHello.Accounts.{User, Credential}    # -> update

      .
      .

    # update next def block
    def list_users do
      User
      |> Repo.all()
      |> Repo.preload(:credential)
    end

      .
      .

    # update next def block
    def get_user!(id) do
      User
      |> Repo.get!(id)
      |> Repo.preload(:credential)
    end
  ```

  - ↑ それぞれ `|> Repo.preload(:credential)` を追加実装したことで、ユーザーを取得するタイミングでクレデンシャルをプリロードするよう修正した

  ```elixir
      .
      .

    def create_user(attrs \\ %{}) do
      %User{}
      |> User.changeset(attrs)
      |> Ecto.Changeset.cast_assoc(:credential, with: &Credential.changeset/2)    # -> add
      |> Repo.insert()
    end

      .
      .

    def update_user(%User{} = user, attrs) do
      user
      |> User.changeset(attrs)
      |> Ecto.Changeset.cast_assoc(:credential, with: &Credential.changeset/2)    # -> add
      |> Repo.update()
    end

      .
      .

    # alias PhxHello.Accounts.Credential    # -> delete

    @doc """
    Returns the list of credentials.

  ```

  - ↑ `Ecto.Changeset` を再構築

- `lib/phx_hello_web/templates/user/form.html.eex`

  親フォームに入力フィールド（`Email` 用）を追加します

  ```elixir
    <div>
      <%# add next div block %>
      <div class="form-group">
        <%= inputs_for f, :credential, fn cf -> %>
          <%= label cf, :email %>
          <%= text_input cf, :email %>
          <%= error_tag cf, :email %>
        <% end %>
      </div>

      <%= submit "Save" %>
    </div>
  <% end %>
  ```

- `lib/phx_hello_web/templates/user/show.html.eex`

  ユーザー `show` テンプレートにEmailを表示するよう、以下実装

  ```html
    <%# add next li block %>

    <li>
      <strong>Email:</strong>
      <%= @user.credential.email %>
    </li>

  </ul>
  ```

#### 表示確認

- [http://localhost:4000/users/new](http://localhost:4000/users/new)

  <img width="643" alt="" src="https://user-images.githubusercontent.com/33124627/89285898-2b649900-d68c-11ea-95cf-babf92992c30.png">

  - __Emailを入力せずにSAVE__ しようとすると、下記のように __エラーメッセージ__ を出してくれる

    ![スクリーンショット](https://user-images.githubusercontent.com/33124627/89355840-59cb8e00-d6f7-11ea-9944-f589c518b7b4.png)

  - ユーザーshow画面

    以下の通り、項目Email表示が追加されました

    ![スクリーンショット](https://user-images.githubusercontent.com/33124627/89355601-be3a1d80-d6f6-11ea-8d0a-4f555fd4e7b2.png)

---

### アカウント関数追加（Emailでのパスワードサインイン）

メールアドレスによる簡易的な __ユーザー認証__ 機能を実装します

- `lib/phx_hello/accounts.ex`  
  `defmodule` 最下部に、以下を追加

  ```elixir
  # add next def block
  @doc """
  Authenticate by Email password.
  """
  def authenticate_by_email_password(email, _password) do
    query =
      from u in User,
        inner_join: c in assoc(u, :credential),
        where: c.email == ^email

    case Repo.one(query) do
      %User{} = user -> {:ok, user}
      nil -> {:error, :unauthorized}
    end
  end
  ```

  - これにより、ユーザーを検索し、入力されたクレデンシャルが有効かどうかを確認します

#### サインインページを実装

- `lib/phx_hello_web/controllers/session_controller.ex`  
  [ファイルを新規作成](https://github.com/miolab/programming_ex/blob/master/phx_hello/lib/phx_hello_web/controllers/session_controller.ex)（コントローラー）

- `lib/phx_hello_web/router.ex`  
  セッションのルートを実装

  ```elixir
  scope "/", PhxHelloWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show

    resources "/users", UserController
    resources "/sessions", SessionController, only: [:new, :create, :delete],    # -> add
                                              singleton: true    # -> add
  end
  ```

  つづけて、`defmodule` 最下部に以下追記

  ```elixir
  # add next defp block
  defp authenticate_user(conn, _) do
    case get_session(conn, :user_id) do
      nil ->
        conn
        |> Phoenix.Controller.put_flash(:error, "Login required")
        |> Phoenix.Controller.redirect(to: "/")
        |> halt()
      user_id ->
        assign(conn, :current_user, PhxHello.Accounts.get_user!(user_id))
    end
  end
  ```

- `lib/phx_hello_web/views/session_view.ex`  
  [ファイル新規作成](https://github.com/miolab/programming_ex/blob/master/phx_hello/lib/phx_hello_web/views/session_view.ex)（ビュー）

- `lib/phx_hello_web/templates/session/new.html.eex`  
  [ファイル新規作成](https://github.com/miolab/programming_ex/blob/master/phx_hello/lib/phx_hello_web/templates/session/new.html.eex)（テンプレート）

#### ルート~表示〜機能確認

- 新たに作られたルート `/sessions` を確認します

  ```elixir
  $ mix phx.routes
      .
      .
    session_path  GET     /sessions/new          PhxHelloWeb.SessionController :new
    session_path  POST    /sessions              PhxHelloWeb.SessionController :create
    session_path  DELETE  /sessions              PhxHelloWeb.SessionController :delete
      .
      .
  ```

- [http://localhost:4000/sessions/new](http://localhost:4000/sessions/new)

  ![2020-08-06 19 45 28](https://user-images.githubusercontent.com/33124627/89530054-cd20ed00-d828-11ea-9073-a6713562f1fd.png)

  - 存在しないEmail入力をすると、次のようにエラー表示

    ![スクリーンショット 2020-08-06 19 46 27](https://user-images.githubusercontent.com/33124627/89530069-d4e09180-d828-11ea-8e83-a8681d4707ac.png)

  - 正しいEmailを入力（≒認証クリア）すると、Homeへリダイレクトします

    ![スクリーンショット 2020-08-06 19 46 50](https://user-images.githubusercontent.com/33124627/89530078-d742eb80-d828-11ea-848f-619441448a01.png)

---

### コンテキスト間データの依存関係処理

コンテンツ管理システム（__CMS__）を実装します。

#### 機能要件

1. __ページの作成・保存、および更新__

1. __作成されたページ__ と __著者（Author）__ とが紐付けられる

1. __著者情報__ も作成ページ上で表示する

#### 実装

- `CMS` コンテキストを新規に作成

  ```elixir
  $ mix phx.gen.html CMS Page pages title:string body:text views:integer --web CMS

  * creating lib/phx_hello_web/controllers/cms/page_controller.ex
  * creating lib/phx_hello_web/templates/cms/page/edit.html.eex
  * creating lib/phx_hello_web/templates/cms/page/form.html.eex
  * creating lib/phx_hello_web/templates/cms/page/index.html.eex
  * creating lib/phx_hello_web/templates/cms/page/new.html.eex
  * creating lib/phx_hello_web/templates/cms/page/show.html.eex
  * creating lib/phx_hello_web/views/cms/page_view.ex
  * creating test/phx_hello_web/controllers/cms/page_controller_test.exs
  * creating lib/phx_hello/cms/page.ex
  * creating priv/repo/migrations/20200808071819_create_pages.exs
  * creating lib/phx_hello/cms.ex
  * injecting lib/phx_hello/cms.ex
  * creating test/phx_hello/cms_test.exs
  * injecting test/phx_hello/cms_test.exs

  Add the resource to your CMS :browser scope in lib/phx_hello_web/router.ex:

      scope "/cms", PhxHelloWeb.CMS, as: :cms do
        pipe_through :browser
        ...
        resources "/pages", PageController
      end


  Remember to update your repository by running migrations:

      $ mix ecto.migrate

  ```

  - `$ mix phx.gen.html` の __`--web`__ オプション

    コントローラーやビュー等のWebモジュールへ割り当てる名前空間を決めるもの

  - 上記の結果中、以下の部分については後述します

    ```
    `Add the resource to your CMS :browser scope in lib/phx_hello_web/router.ex:`

    scope "/cms", PhxHelloWeb.CMS, as: :cms do
      .
      .
    ```

- `views` はユーザーが直接更新しないため、属性とパラメータを削除します

  - `lib/phx_hello_web/templates/cms/page/form.html.eex`

    ```elixir
    <%= label f, :title %>
    <%= text_input f, :title %>
    <%= error_tag f, :title %>

    <%= label f, :body %>
    <%= textarea f, :body %>
    <%= error_tag f, :body %>

    <%= label f, :views %>    # -> delete
    <%= number_input f, :views %>    # -> delete
    <%= error_tag f, :views %>    # -> delete
    ```

  - `lib/phx_hello/cms/page.ex`

    ```elixir
    def changeset(page, attrs) do
      page
      # # update as next
      # |> cast(attrs, [:title, :body, :views])
      |> cast(attrs, [:title, :body])
      # |> validate_required([:title, :body, :views])
      |> validate_required([:title, :body])
    end
    ```

  - `priv/repo/migrations/20200808071819_create_pages.exs`  
    `views` にデフォルト値を設定

    ```elixir
    def change do
      create table(:pages) do
        add :title, :string
        add :body, :text
        # add :views, :integer    # -> delete
        add :views, :integer, default: 0    # -> add
    ```

- `lib/phx_hello_web/router.ex`  
  前述の、`$ mix phx.gen.html CMS ...` 結果の指示内容（`scope ~ end`）を追記

  ```elixir
  # Other scopes may use custom stacks.
  # scope "/api", PhxHelloWeb do
  #   pipe_through :api
  # end
  scope "/cms", PhxHelloWeb.CMS, as: :cms do
    pipe_through [:browser, :authenticate_user]

    resources "/pages", PageController
  end
  ```

- マイグレーション

  ```elixir
  $ mix ecto.migrate

  Compiling 5 files (.ex)
  Generated phx_hello app

  13:11:36.046 [info]  == Running 20200808071819 PhxHello.Repo.Migrations.CreatePages.change/0 forward

  13:11:36.048 [info]  create table pages

  13:11:36.083 [info]  == Migrated 20200808071819 in 0.0s
  ```

- ここまでの結果確認

  （[http://localhost:4000/sessions/new](http://localhost:4000/sessions/new)でログイン認証している状態で）  
  [http://localhost:4000/cms/pages](http://localhost:4000/cms/pages)

  <img width="670" alt="" src="https://user-images.githubusercontent.com/33124627/90193285-92f2b500-ddff-11ea-8756-b264460b7526.png">

  - `New Page` が追加表示されていることを確認しました

- Authorスキーマを生成する

  ```elixir
  $ mix phx.gen.context CMS Author authors bio:text role:string genre:string user_id:references:users:unique

  You are generating into an existing context.

  The PhxHello.CMS context currently has 6 functions and 1 files in its directory.

    * It's OK to have multiple resources in the same context as long as they are closely related. But if a context grows too large, consider breaking it apart

    * If they are not closely related, another context probably works better

  The fact two entities are related in the database does not mean they belong to the same context.

  If you are not sure, prefer creating a new context over adding to the existing one.

  Would you like to proceed? [Yn] y
  * creating lib/phx_hello/cms/author.ex
  * creating priv/repo/migrations/20200811111208_create_authors.exs
  * injecting lib/phx_hello/cms.ex
  * injecting test/phx_hello/cms_test.exs

  Remember to update your repository by running migrations:

      $ mix ecto.migrate

  ```

  - コンテキスト・ジェネレータ `$ mix phx.gen.context` により、コード注入しました

- `priv/repo/migrations/20200811111208_create_authors.exs`  
  外部キー制約を以下の通り変更

  ```elixir
  def change do
    create table(:authors) do
      add :bio, :text
      add :role, :string
      add :genre, :string
      # add :user_id, references(:users, on_delete: :nothing)  # -> delete
      add :user_id, references(:users, on_delete: :delete_all),  # -> add
                    null: false    # -> add
  ```

  アプリケーションのコードを切り離して、DB側でデータ整合性をとるよう設定しました

- ページテーブルに `author_id` フィールドを追加

  ```elixir
  $ mix ecto.gen.migration add_author_id_to_pages

  Generated phx_hello app
  * creating priv/repo/migrations/20200812010458_add_author_id_to_pages.exs
  ```

- `priv/repo/migrations/20200812010458_add_author_id_to_pages.exs`
  `def change do ~ end` 内を、以下のように記述

  ```elixir
  def change do
    alter table(:pages) do
      add :author_id, references(:authors, on_delete: :delete_all),
                      null: false
    end

    create index(:pages, [:author_id])
  end
  ```

  - `on_delete: :delete_all` により、親（Author）が削除されたら、紐付けられたページも削除します

- マイグレーション

  ```elixir
  $ mix ecto.migrate

  10:08:37.105 [info]  == Running 20200811111208 PhxHello.Repo.Migrations.CreateAuthors.change/0 forward

  10:08:37.107 [info]  create table authors

  10:08:37.127 [info]  create index authors_user_id_index

  10:08:37.132 [info]  == Migrated 20200811111208 in 0.0s

  10:08:37.154 [info]  == Running 20200812010458 PhxHello.Repo.Migrations.AddAuthorIdToPages.change/0 forward

  10:08:37.154 [info]  alter table pages

  10:08:37.155 [info]  create index pages_author_id_index

  10:08:37.156 [info]  == Migrated 20200812010458 in 0.0s
  ```

  ここまでで、DB準備が整いました

### コンテキスト間データの依存関係処理（続き）

Authorと投稿記事をCMS側に統合します

- ページと作者および、作者とユーザーを結びつけます

  - `lib/phx_hello/cms/page.ex`  

    ```elixir
    defmodule PhxHello.CMS.Page do
      use Ecto.Schema
      import Ecto.Changeset

      alias PhxHello.CMS.Author    # -> add

      schema "pages" do
        field :body, :string
        field :title, :string
        field :views, :integer
        belongs_to :author, Author    # -> add

        timestamps()
      end
    ```

  - `lib/phx_hello/cms/author.ex`

    ```elixir
    defmodule PhxHello.CMS.Author do
      use Ecto.Schema
      import Ecto.Changeset

      alias PhxHello.CMS.Page    # -> add

      schema "authors" do
        field :bio, :string
        field :genre, :string
        field :role, :string
        # field :user_id, :id    # -> delete

        has_many :pages, Page    # -> add
        belongs_to :user, PhxHello.Accounts.User    # -> add

        timestamps()
      end
    ```

- `lib/phx_hello/cms.ex`

  データ取得方法を変更

  ```elixir
  # # add and update as belows
      .
      .
  alias PhxHello.CMS.{Page, Author}
  alias PhxHello.Accounts
      .
      .
  def list_pages do
    Page
    |> Repo.all()
    |> Repo.preload(author: [user: :credential])
  end
      .
      .
  def get_page!(id) do
    Page
    |> Repo.get!(id)
    |> Repo.preload(author: [user: :credential])
  end
      .
      .
  def get_author!(id) do
    Author
    |> Repo.get!(id)
    |> Repo.preload(user: :credential)
  end
      .
      .
  ```

  つづいて、永続化を設定します

  ```elixir
  # # update as belows
  def create_page(%Author{} = author, attrs \\ %{}) do
    %Page{}
    |> Page.changeset(attrs)
    |> Ecto.Changeset.put_change(:author_id, author.id)
    |> Repo.insert()
  end

  # add belows
  def ensure_author_exists(%Accounts.User{} = user) do
    %Author{user_id: user.id}
    |> Ecto.Changeset.change()
    |> Ecto.Changeset.unique_constraint(:user_id)
    |> Repo.insert()
    |> handle_existing_author()
  end

  defp handle_existing_author({:ok, author}), do: author

  defp handle_existing_author({:error, changeset}) do
    Repo.get_by!(Author, user_id: changeset.data.user_id)
  end
  ```

- Webレイヤー側更新

  - `lib/phx_hello_web/controllers/cms/page_controller.ex`

    ```elixir
    defmodule PhxHelloWeb.CMS.PageController do
      use PhxHelloWeb, :controller

      alias PhxHello.CMS
      alias PhxHello.CMS.Page

      plug :require_existing_author    # -> add
      plug :authorize_page when action in [:edit, :update, :delete]    # -> add

      .
      .

      # add belows (into defmodule's last area)
      defp require_existing_author(conn, _) do
        author = CMS.ensure_author_exists(conn.assigns.current_user)
        assign(conn, :current_author, author)
      end

      defp authorize_page(conn, _) do
        page = CMS.get_page!(conn.params["id"])

        if conn.assigns.current_author.id == page.author_id do
          assign(conn, :page, page)
        else
          conn
          |> put_flash(:error, "You can't modify that page")
          |> redirect(to: Routes.cms_page_path(conn, :index))
          |> halt()
        end
      end
    end
    ```

    つづけて、

    ```elixir
      .
      .
    # # update as belows
    def create(conn, %{"page" => page_params}) do
      case CMS.create_page(conn.assigns.current_author, page_params) do
        {:ok, page} ->
          conn
          |> put_flash(:info, "Page created successfully.")
          |> redirect(to: Routes.cms_page_path(conn, :show, page))

        {:error, %Ecto.Changeset{} = changeset} ->
          render(conn, "new.html", changeset: changeset)
      end
    end
      .
      .
    # # update as belows
    def edit(conn, _) do
      changeset = CMS.change_page(conn.assigns.page)
      render(conn, "edit.html", changeset: changeset)
    end

    # # update as belows
    def update(conn, %{"page" => page_params}) do
      case CMS.update_page(conn.assigns.page, page_params) do
        {:ok, page} ->
          conn
          |> put_flash(:info, "Page updated successfully.")
          |> redirect(to: Routes.cms_page_path(conn, :show, page))

        {:error, %Ecto.Changeset{} = changeset} ->
          render(conn, "edit.html", changeset: changeset)
      end
    end

    # # update as belows
    def delete(conn, _) do
      {:ok, _page} = CMS.delete_page(conn.assigns.page)

      conn
      |> put_flash(:info, "Page deleted successfully.")
      |> redirect(to: Routes.cms_page_path(conn, :index))
    end
    ```

- 表示されたページにAuthorを載せます

  - `lib/phx_hello_web/views/cms/page_view.ex`  

    ```elixir
    defmodule PhxHelloWeb.CMS.PageView do
      use PhxHelloWeb, :view

      # add: alias and def ~ end block
      alias PhxHello.CMS

      def author_name(%CMS.Page{author: author}) do
        author.user.name
      end
    end
    ```

  - `lib/phx_hello_web/templates/cms/page/show.html.eex`

    ```html
      # add next li block
      <li>
        <strong>Author:</strong>
        <%= author_name(@page) %>
      </li>
    </ul>
    ```

#### ページ確認

- [http://localhost:4000/cms/pages/new](http://localhost:4000/cms/pages/new)

  ![スクリーンショット 2020-08-13 7 40 24](https://user-images.githubusercontent.com/33124627/90078269-51023a00-dd3f-11ea-99cb-70a2a3fbb834.png)

- SAVE後の画面↓で、著者情報が表示されるようになりました

  ![スクリーンショット 2020-08-13 7 41 23](https://user-images.githubusercontent.com/33124627/90078282-5bbccf00-dd3f-11ea-8c32-1e60d5dd3a55.png)

---

### CMSの関数追加（ページ閲覧回数の表示）

ページ閲覧回数を表示する機能を追加実装します

- `lib/phx_hello/cms.ex`

  ```elixir
  # add belows (into defmodule last area)
  @doc """
  """
  def inc_page_views(%Page{} = page) do
    {1, [%Page{views: views}]} =
      from(p in Page, where: p.id == ^page.id, select: [:views])
      |> Repo.update_all(inc: [views: 1])

    put_in(page.views, views)
  end
  ```

  - 指定したページIDを `Repo.update_all` に渡すクエリを作成

- `lib/phx_hello_web/controllers/cms/page_controller.ex`

  ```elixir
  def show(conn, %{"id" => id}) do
    # # update as belows
    # page = CMS.get_page!(id)    # -> delete
    page =
      id
      |> CMS.get_page!()
      |> CMS.inc_page_views()

    render(conn, "show.html", page: page)
  end
  ```

  - `|> CMS.inc_page_views()` により、更新されたページを返すように変更しています

#### ページ確認

- [http://localhost:4000/cms/pages](http://localhost:4000/cms/pages)

  <img width="633" alt="" src="https://user-images.githubusercontent.com/33124627/90308269-09cfa100-df19-11ea-8003-4c91c1456a2d.png">

  - 閲覧回数 `Views` 表示機能を追加しました





- ``

```elixir
```




- ``

```elixir
```




- ``

```elixir
```




- ``

```elixir
```







---

## []()

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
