defmodule ExShopCart.Commanded.BankRouter do
  use Commanded.Commands.Router
  alias ExShopCart.Commanded.{OpenAccount, DepositMoney, BankAccount}

  dispatch(OpenAccount,
    to: OpenAccountHandler,
    aggregate: BankAccount,
    identity: :account_number
  )

  dispatch(DepositMoney,
    to: DepositMoneyHandler,
    aggregate: BankAccount,
    identity: :account_number
  )

  ### if we want to skip the handler and send directly to the Aggregate
  # identify BankAccount, by: :account_number
  # dispatch [OpenAccount, DepositMoney], to: BankAccount
end
