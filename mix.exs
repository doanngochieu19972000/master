defmodule Crawl.MixProject do
  use Mix.Project

  def project do
    [
      app: :crawl,
      version: "0.2.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Shopee.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug_cowboy, "~> 2.0"},
      {:crawly, "~> 0.10.0"},
      {:floki, "~> 0.26.0"},
      {:phoenix, "~> 1.5.8"},
      {:jason, "~> 1.0"},
      {:httpoison, "~> 1.5"},
      {:poison, "~> 3.1.0"},
      {:hackney, "~> 1.17"}
    ]
  end
end
