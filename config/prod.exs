use Mix.Config

config :edistillery, EdistilleryWeb.Endpoint,
  http: [port: {:system, "PORT"}],
  load_from_system_env: true,
  url: [host: "localhost", port: {:system, "PORT"}],
  server: true,
  root: ".",
  version: Application.spec(:myapp, :vsn),
  secret_key_base: "RWWcEZKhxbI2oYkSH8vXW54J77CARHKKIoySwZzdxgM4Zre+hkyjXl0VWkxDWd/4"

# Do not print debug messages in production
# config :logger, level: :info

config :logger, :console, level: :info,
       format: "$time $metadata[$level] $message\n",
       metadata: [:request_id]

# Configure your database
config :edistillery, Edistillery.Repo,
       adapter: Ecto.Adapters.Postgres,
       username: "postgres",
       password: "",
       database: "edistillery_prod",
       pool_size: 3
