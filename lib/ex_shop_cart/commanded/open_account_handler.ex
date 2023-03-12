defmodule ExShopCart.Commanded.OpenAccountHandler do
  @moduledoc """
  OpenAccountHandler
  """

  alias ExShopCart.Commanded.{OpenAccount, BankAccount}

  @behaviour Commanded.Commands.Handler

  def handle(%BankAccount{} = aggregate, %OpenAccount{} = command) do
    %OpenAccount{account_number: account_number, initial_balance: initial_balance} = command

    BankAccount.open_account(aggregate, account_number, initial_balance)
  end
end
