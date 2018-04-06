defmodule ArkElixir.MixProject do
  use Mix.Project

  def project do
    [
      app: :ark_elixir,
      version: "0.2.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      applications: [:httpoison],
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:base58, "~> 0.1.0"},
      {:exbtc, "~> 0.1.3"},
      {:poison, "~> 3.1"},
      {:temp, "~> 0.4"},
      {:tesla, "~> 1.0.0-beta.1"},
      {:mock, "~> 0.3.0", only: :test}
    ]
  end
end
