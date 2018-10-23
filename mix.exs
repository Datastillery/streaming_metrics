defmodule StreamingMetrics.MixProject do
  use Mix.Project

  def project do
    [
      app: :streaming_metrics,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {StreamingMetrics, []},
      extra_applications: [:logger],
      applications: [:ex_aws_cloudwatch, :ex_aws]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 0.11.1"},
      {:mock, "~> 0.3.1", only: :test, runtime: false},
      # v2.0.3 + metric timestamp fix; HEAD of master on 2018-08-11
      {:ex_aws_cloudwatch,
      github: "ex-aws/ex_aws_cloudwatch",
      sha: "258c0c2a81acf6acf68439d2e9c4cfdf8dec10eb",
      app: false},
      {:ex_aws, "~> 2.0.0"},
      {:credo, "~> 0.10", only: [:dev, :test], runtime: false}
    ]
  end
end
