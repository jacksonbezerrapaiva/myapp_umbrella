# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :myapp_web, MyappWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "tatfPutEX279AcWaREUqgmvxItYdYBDUeR8hs6byW91lME/djAmzu/q3Z79TXKf8",
  render_errors: [view: MyappWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MyappWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
config :myapp_web, MyappWebQueue.Broker,
  adapter: ConduitSQS,
  access_key_id: System.get_env("AWS_ACCESS_KEY_ID"),
  secret_access_key: System.get_env("AWS_SECRET_ACCESS_KEY"),
  region: System.get_env("AWS_REGION")

import_config "#{Mix.env}.exs"