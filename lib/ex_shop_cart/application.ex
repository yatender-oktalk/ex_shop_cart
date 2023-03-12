defmodule ExShopCart.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application


  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      ExShopCart.Repo,
      # Start the Telemetry supervisor
      ExShopCartWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ExShopCart.PubSub},
      # Start the Endpoint (http/https)
      ExShopCartWeb.Endpoint,
      ExShopCart.Commanded.BankApp
      # Start a worker by calling: ExShopCart.Worker.start_link(arg)
      # {ExShopCart.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ExShopCart.Supervisor]

    # router(ExShopCart.Billing.Router)
    # router(ExShopCart.Customers.Router)
    # router(ExShopCart.Notifications.Router)
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ExShopCartWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
