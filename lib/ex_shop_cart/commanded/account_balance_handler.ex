# defmodule ExShopCart.Commanded.AccountBalanceHandler do
#   use Commanded.Event.Handler,
#     application: ExShopCart.Commanded.BankApp,
#     name: __MODULE__

#   alias ExShopCart.Commanded.{BankAccountOpened}

#   def init do
#     with {:ok, _pid} <- Agent.start_link(fn -> 0 end, name: __MODULE__) do
#       :ok
#     end
#   end

#   def handle(%BankAccountOpened{initial_balance: initial_balance}, _metadata) do
#     IO.inspect("NOW")
#     Agent.update(__MODULE__, fn _ -> initial_balance end)
#   end

#   def current_balance do
#     Agent.get(__MODULE__, fn balance -> balance end)
#   end
# end
