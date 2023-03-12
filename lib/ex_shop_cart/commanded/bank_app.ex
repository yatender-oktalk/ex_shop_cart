defmodule ExShopCart.Commanded.BankApp do
  alias ExShopCart.Commanded.BankRouter

  use Commanded.Application,
  otp_app: :ex_shop_cart,
  event_store: [
    adapter: Commanded.EventStore.Adapters.EventStore,
    event_store: ExShopCart.EventStore
    ],
    pubsub: :local,
    registry: :local,
    serializer: Commanded.Serialization.JsonSerializer

    def init(config) do
      {:ok, config}
    end

  router(BankRouter)
end
