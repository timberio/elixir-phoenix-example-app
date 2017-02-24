use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :elixir_phoenix_example_app, ElixirPhoenixExampleApp.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [node: ["node_modules/brunch/bin/brunch", "watch", "--stdin",
                    cd: Path.expand("../", __DIR__)]]


# Watch static and templates for browser reloading.
config :elixir_phoenix_example_app, ElixirPhoenixExampleApp.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex)$}
    ]
  ]

# Configure timber to be development friendly
config :timber,
  transport: Timber.Transports.IODevice

config :timber, :io_device,
  colorize: true,
  format: :logfmt,
  print_timestamps: true,
  print_log_level: true,
  print_metadata: false

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :elixir_phoenix_example_app, ElixirPhoenixExampleApp.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "elixir_phoenix_example_app_dev",
  hostname: "localhost",
  pool_size: 10
