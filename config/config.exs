# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :elmelixirstarter,
  ecto_repos: [Elmelixirstarter.Repo]

# Configures the endpoint
config :elmelixirstarter, Elmelixirstarter.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "not a secret key really",
  render_errors: [view: Elmelixirstarter.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Elmelixirstarter.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Auth
config :ueberauth, Ueberauth,
  providers: [ twitter: { Ueberauth.Strategy.Twitter, [] } ]

config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "Elmelixirstarter",
  ttl: { 30, :days },
  allowed_drift: 2000,
  verify_issuer: true, # optional
  # replace this before production, obviously 💻
  secret_key: "another secret key you need",
  serializer: Elmelixirstarter.GuardianSerializer

# Import Twitter config

import_config("twitter.exs")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"