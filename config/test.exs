use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :elmelixirstarter, Elmelixirstarter.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :elmelixirstarter, Elmelixirstarter.Repo,
  adapter: Ecto.Adapters.Postgres,
  hostname: System.get_env("PG_HOST") || "localhost",
  username: System.get_env("PG_USER") || "postgres",
  password: System.get_env("PG_PASS") || "postgres",
  database: "elmelixirstarter_test",
  pool: Ecto.Adapters.SQL.Sandbox

config :guardian, Guardian,
  secret_key: "SOME FAKE LONG SECRET KEY THAT WORKS FOR TESTS 1234567890 1234567890"

config :elmelixirstarter, Elmelixirstarter.Endpoint,
  secret_key_base: "SOME FAKE LONG SECRET KEY BASE THAT WORKS FOR TESTS 1234567890 1234567890"
