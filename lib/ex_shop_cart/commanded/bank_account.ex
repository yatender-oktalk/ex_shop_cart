defmodule ExShopCart.Commanded.BankAccount do
  @moduledoc """
  Aggregate for the bank account
  """
  alias ExShopCart.Commanded.{OpenAccount, BankAccountOpened, BankAccount}
  defstruct [:account_number, :balance]

  def execute(%BankAccount{account_number: nil}, %OpenAccount{
        account_number: account_number,
        initial_balance: initial_balance
      })
      when initial_balance > 0 do
    %BankAccountOpened{account_number: account_number, initial_balance: initial_balance}
  end

  def execute(%BankAccount{}, %OpenAccount{initial_balance: initial_balance})
      when initial_balance <= 0 do
    {:error, :initial_balance_must_be_above_zero}
  end

  def execute(%BankAccount{}, %OpenAccount{}) do
    {:error, :account_already_opened}
  end

  def open_account(aggregate, account_number, initial_balance) do
    execute(aggregate, %OpenAccount{account_number: account_number, initial_balance: initial_balance})
  end
  ## State mutators
  def apply(%BankAccount{} = account, %BankAccountOpened{} = event) do
    %BankAccountOpened{account_number: account_number, initial_balance: initial_balance} = event

    %BankAccount{account | account_number: account_number, balance: initial_balance}
  end
end
