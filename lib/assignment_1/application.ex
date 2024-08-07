# lib/assignment_1/application.ex
defmodule Assignment1.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Assignment1Web.Telemetry,
      Assignment1.Repo,
      {DNSCluster, query: Application.get_env(:assignment_1, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Assignment1.PubSub},
      {Finch, name: Assignment1.Finch},
      Assignment1Web.Endpoint
    ]

    opts = [strategy: :one_for_one, name: Assignment1.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def config_change(changed, _new, removed) do
    Assignment1Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
