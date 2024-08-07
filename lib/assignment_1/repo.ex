# lib/assignment_1/repo.ex
defmodule Assignment1.Repo do
  use GenServer
  alias Mongo

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  @impl true
  def init(_) do
    {:ok, conn} = Mongo.start_link(url: "mongodb://admin:dev@localhost:27017/assignment_1?authSource=assignment_1")
    {:ok, conn}
  end

  def get_conn do
    GenServer.call(__MODULE__, :get_conn)
  end

  @impl true
  def handle_call(:get_conn, _from, conn) do
    {:reply, conn, conn}
  end

end
