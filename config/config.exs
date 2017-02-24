# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :elixir_phoenix_example_app,
  ecto_repos: [ElixirPhoenixExampleApp.Repo]

# Configures the endpoint
config :elixir_phoenix_example_app, ElixirPhoenixExampleApp.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "PIW+jnFP5piAAlp679uxb3Px1YD2pA7IQXqnQz67AC/tZXiAoqMpjjJTEFZ6RQXp",
  render_errors: [view: ElixirPhoenixExampleApp.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ElixirPhoenixExampleApp.PubSub,
           adapter: Phoenix.PubSub.PG2],
  instrumenters: [Timber.Integrations.PhoenixInstrumenter]

# Configure Timber to capture Ecto events
config :my_app, ElixirPhoenixExampleApp.Repo,
  loggers: [{Timber.Integrations.EctoLogger, :log, [:info]}]

# Configure logger to use Timber
config :logger,
  backends: [Timber.LoggerBackend],
  handle_otp_reports: false # Timber handles errors, structures them, and adds additional metadata

config :timber, :capture_errors, true

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
