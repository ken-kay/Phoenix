defmodule GitClone.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      GitCloneWeb.Telemetry,
      # Start the Ecto repository
      GitClone.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: GitClone.PubSub},
      # Start Finch
      {Finch, name: GitClone.Finch},
      # Start the Endpoint (http/https)
      GitCloneWeb.Endpoint
      # Start a worker by calling: GitClone.Worker.start_link(arg)
      # {GitClone.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GitClone.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GitCloneWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
