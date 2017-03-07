use Mix.Config

# Get existing instruments so that we don't overwrite.
instrumenters =
  Application.get_env(:elixir_phoenix_example_app, ElixirPhoenixExampleApp.Endpoint)
  |> Keyword.get(:instrumenters, [])

# Add the Timber instrumenter
new_instrumenters =
  [Timber.Integrations.PhoenixInstrumenter | instrumenters]
  |> Enum.uniq()

# Update the instrumenters so that we can structure Phoenix logs
config :elixir_phoenix_example_app, ElixirPhoenixExampleApp.Endpoint,
  instrumenters: new_instrumenters

# Structure Ecto logs
config :elixir_phoenix_example_app, ElixirPhoenixExampleApp.Repo,
  loggers: [{Timber.Integrations.EctoLogger, :log, [:info]}]

# Use Timber as the logger backend
# Feel free to add additional backends if you want to send you logs to multiple devices.
config :logger,
  backends: [Timber.LoggerBackend]

# Direct logs to STDOUT for Heroku. We'll use Heroku drains to deliver logs.
config :timber,
  transport: Timber.Transports.IODevice

# For dev / test environments, always log to STDOUt and format the logs properly
if Mix.env() == :dev || Mix.env() == :test do
  config :timber, transport: Timber.Transports.IODevice

  config :timber, :io_device,
    colorize: true,
    format: :logfmt,
    print_timestamps: true,
    print_log_level: true,
    print_metadata: false # turn this on to view the additiional metadata
end

# Need help? Contact us at support@timber.io
