# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :pomodoro,
  ecto_repos: [Pomodoro.Repo]

# Configures the endpoint
config :pomodoro, Pomodoro.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "TkJ5JB/bEAekQZHALygzLbKx4KfGB+MRfdcAn+9hgRbxt1edD7CN/bg4XQSbbk3Z",
  render_errors: [view: Pomodoro.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Pomodoro.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :phoenix, :template_engines,
  slim: PhoenixSlime.Engine,
  slime: PhoenixSlime.Engine

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
