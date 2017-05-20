use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or you later on).
config :elmelixirstarter, Elmelixirstarter.Endpoint,
  secret_key_base: "BI44EvOJLhRYs0dMDc1rFW5HIfUzNhqMzaG9pPxWeV5S88u1etUkwdqfPKl60A9R"

# Configure your database
config :elmelixirstarter, Elmelixirstarter.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "elmelixirstarter_prod",
  pool_size: 20
