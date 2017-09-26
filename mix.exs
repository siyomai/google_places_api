defmodule GooglePlacesApi.Mixfile do
  use Mix.Project

  def project do
    [
      app: :google_places_api,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      name: "GooglePlacesApi",
      source_url: "https://github.com/siyomai/google_places_api"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 0.13"},
      {:poison, "~> 3.1"},
      {:mock, "~> 0.2.0", only: :test}
    ]
  end

  defp description() do
    "A simple lightweight API wrapper for the google places api."
  end

  defp package() do
    [
      # This option is only needed when you don't want to use the OTP application name
      name: "google_places_api",
      # These are the default files included in the package
      files: ["lib", "test", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Arnaldo Tayao Jr"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/siyomai/google_places_api"}
    ]
  end
end
