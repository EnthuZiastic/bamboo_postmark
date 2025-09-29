defmodule BambooPostmark.Mixfile do
  use Mix.Project

  @source_url "https://github.com/pablo-co/bamboo_postmark"
  @version "1.0.0"

  def project do
    [
      app: :bamboo_postmark,
      version: @version,
      elixir: "~> 1.4",
      name: "Bamboo Postmark",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      package: package(),
      deps: deps(),
      docs: docs()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:bamboo, ">= 2.5.0"},
      {:hackney, ">= 1.25.0", override: true},
      {:poison, ">= 6.0.0", only: :test},
      {:plug, "~> 1.18.1"},
      {:plug_cowboy, "~> 2.7.4", only: [:test, :dev]},
      {:ex_doc, "> 0.0.0", only: :dev, runtime: false},
      {:credo, "~> 1.7.12", only: [:dev, :test], runtime: false}
    ]
  end

  defp package do
    [
      description: "A Bamboo adapter for Postmark",
      maintainers: ["Pablo Cárdenas"],
      licenses: ["MIT"],
      links: %{
        "Changelog" => "https://hexdocs.pm/bamboo/postmark/changelog.html",
        "GitHub" => @source_url
      }
    ]
  end

  defp docs do
    [
      extras: [
        "CHANGELOG.md": [title: "Changelog"],
        "LICENSE.md": [title: "License"],
        "README.md": [title: "Overview"]
      ],
      main: "readme",
      source_url: @source_url,
      homepage_url: @source_url,
      formatters: ["html"]
    ]
  end
end
