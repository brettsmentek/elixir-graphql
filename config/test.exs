use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :elixirgraphql, ElixirgraphqlWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :elixirgraphql, Elixirgraphql.Repo,
  database: "elixirgraphql_test",
  hostname: "localhost",
  username: System.get_env("POSTGRES_USER") || System.get_env("USER"),
  pool: Ecto.Adapters.SQL.Sandbox

if System.get_env("CI") do
  config :junit_formatter,
    report_dir: "/tmp/test-results/exunit",
    report_file: "results.xml"
end
