use Mix.Config

config :edistillery, EdistilleryWeb.Endpoint,
  http: [port: 4001],
  server: false

config :logger, level: :warn

config :edistillery, Edistillery.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "",
  database: "edistillery_test",
  pool: Ecto.Adapters.SQL.Sandbox
