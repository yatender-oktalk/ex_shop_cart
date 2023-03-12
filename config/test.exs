import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :ex_shop_cart, ExShopCart.Repo,
  username: "postgres",
  password: "postgres",
  database: "ex_shop_cart_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ex_shop_cart, ExShopCartWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "Q038wi93/5C+zTrFNMzRenkKWjee9acTQu/czvNuarzMAscK8ySDxsaueeBxvJYT",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

config :ex_shop_cart, ExShopCart.Application,
  event_store: [
    adapter: Commanded.EventStore.Adapters.InMemory,
    serializer: Commanded.Serialization.JsonSerializer
  ],
  pubsub: :local,
  registry: :local

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
