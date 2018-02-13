# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :edistillery,
  ecto_repos: [Edistillery.Repo]

# Configures the endpoint
config :edistillery, EdistilleryWeb.Endpoint,
  secret_key_base: "6EhndogRKmf6KjakfHlGxd2yAYuk+2TLdomOhVBnrvHm2Um0fX9O+C7TPJTwnWeT",
  render_errors: [view: EdistilleryWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Edistillery.PubSub,
           adapter: Phoenix.PubSub.PG2],
  url: [host: "localhost", port: {:system, "PORT"}]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
