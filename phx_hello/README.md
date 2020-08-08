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
  $ mix phx.gen.schema6 User users name:string email:string bio:string number_of_pets:integer

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

### コンテキスト間の依存

コンテンツ管理システム（CMS）を実装します

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
