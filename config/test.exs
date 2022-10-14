import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :goliath_credits, GoliathCredits.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "goliath_credits_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :goliath_credits, GoliathCreditsWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "3q+5BdFS8j3ICY+0LdN88GXvuvwOZfH3J9lgUXtbTdGszDX92H3j7aZVxR5ZXjqF",
  server: false

# In test we don't send emails.
config :goliath_credits, GoliathCredits.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
