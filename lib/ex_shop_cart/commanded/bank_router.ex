defmodule ExShopCart.Commanded.BankRouter do
  use Commanded.Commands.Router
  alias ExShopCart.Commanded.{OpenBankAccount, DepositMoney, BankAccount}

  dispatch(OpenBankAccount,
    to: BankAccount,
    identity: :account_number
  )

  dispatch(DepositMoney,
    to: DepositMoneyHandler,
    aggregate: BankAccount,
    identity: :account_number
  )
end
