use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :elixir_phoenix_example_app, ElixirPhoenixExampleApp.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :elixir_phoenix_example_app, ElixirPhoenixExampleApp.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "elixir_phoenix_example_app_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# Configure timber to be development friendly
config :timber,
  transport: Timber.Transports.IODevice,

config :timber, :io_device,
  colorize: true,
  format: :logfmt,
  print_timestamps: true,
  print_log_level: true,
  print_metadata: false
