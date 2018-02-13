use Mix.Config

config :edistillery,
  ecto_repos: [Edistillery.Repo]

config :edistillery, EdistilleryWeb.Endpoint,
  secret_key_base: "6EhndogRKmf6KjakfHlGxd2yAYuk+2TLdomOhVBnrvHm2Um0fX9O+C7TPJTwnWeT",
  render_errors: [view: EdistilleryWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Edistillery.PubSub,
           adapter: Phoenix.PubSub.PG2],
  url: [host: "localhost", port: {:system, "PORT"}]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

import_config "#{Mix.env}.exs"
