defmodule ElixirCowboy.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    start_cowboy()

    children = [
      # Starts a worker by calling: ElixirCowboy.Worker.start_link(arg)
      # {ElixirCowboy.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirCowboy.Supervisor]
    Supervisor.start_link(children, opts)
  end
  
  def start_cowboy() do
    dispatch =
    :cowboy_router.compile([
      {:_, [{:_, Toy.CowboyHandler, ElixirCowboy.Router}]}
    ])

    case :cowboy.start_clear(:http, [port: 8080], %{env: %{dispatch: dispatch}}) do
      {:ok, pid} ->
        IO.puts("Cowboy is running at http://localhost:8080")

      _ ->
        IO.puts("An error occured when starting cowboy")
    end
  end
end
