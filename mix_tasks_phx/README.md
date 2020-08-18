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

## mix phx.new hoge_hoge

- Phoenix アプリケーション・フレームワークを新規作成する
- `hoge_hoge` の部分は任意のプロジェクト名を入力

  | オプション   | 説明                               | メモ                               |
  | :----------- | :--------------------------------- | :--------------------------------- |
  | --no-ecto    | Ecto を使わずにプロジェクト作成    | `repo.ex` が生成されなくなる       |
  | --no-webpack | webpack を使わずにプロジェクト作成 | webpack はアセット管理に使用される |
