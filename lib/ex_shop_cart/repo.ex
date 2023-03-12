defmodule ExShopCart.Repo do
  use Ecto.Repo,
    otp_app: :ex_shop_cart,
    adapter: Ecto.Adapters.Postgres
end
