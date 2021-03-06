# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :widgets_r_us,
  ecto_repos: [WidgetsRUs.Repo]

# Configures the endpoint
config :widgets_r_us, WidgetsRUsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Rzqdn51Q0C0Fs1FVfYfh7300963FQncGY8GOhBxOsMOAp8a/6B+HbNEhMuSBgVQw",
  render_errors: [view: WidgetsRUsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: WidgetsRUs.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :widgets_r_us, WidgetsRUs.Guardian,
  allowed_algos: ["HS512"],
  verify_module: Guardian.JTW,
  issuer: "widgets_r_us",
  ttl: {30, :days},
  allowed_drift: 2000,
  verify_issuer: true,
  secret_key: "PWZbvRykYgDXx1zyxbmFXSiqUf7u+PgN97333sHRt+dCNjXcqc6y3x/wEnAjprel",
  serializer: WidgetsRUs.Guardian

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
