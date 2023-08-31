import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :no_db, NoDbWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "6TXwvgyvzMo5jDPu/0I/D5vUyR8vdtwQf9G17uuk4YaE+COBXuckcYWUdh3vf2PQ",
  server: false

# In test we don't send emails.
config :no_db, NoDb.Mailer,
  adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
