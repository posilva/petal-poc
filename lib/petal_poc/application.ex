defmodule PetalPoc.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      PetalPoc.Repo,
      # Start the Telemetry supervisor
      PetalPocWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: PetalPoc.PubSub},
      # Start the Endpoint (http/https)
      PetalPocWeb.Endpoint
      # Start a worker by calling: PetalPoc.Worker.start_link(arg)
      # {PetalPoc.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PetalPoc.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PetalPocWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
