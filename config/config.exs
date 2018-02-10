# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :baby_names,
  ecto_repos: [BabyNames.Repo]

# Configures the endpoint
config :baby_names, BabyNamesWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "DvvIXm/PT/EOHYXgdYmmq5E16yvU3QyJ6NJHQDJFQgjjUicD9A7ZZnbeKlPMkQrz",
  render_errors: [view: BabyNamesWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: BabyNames.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
