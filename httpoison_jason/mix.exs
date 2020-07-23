defmodule HttpoisonJason.MixProject do
  use Mix.Project

  def project do
    [
      app: :httpoison_jason,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :httpoison]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:mix_test_watch, "~> 1.0", only: :dev, runtime: false},
      {:httpoison, "~> 1.7"},
      {:jason, "~> 1.2"}
    ]
  end
end
