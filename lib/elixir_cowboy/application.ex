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

  defmodule PageHandler do
    alias Toy.Conn

    def init(req, state) do
      conn =
        %Conn{req_path: :cowboy_req.path(req)}
        |> content_for()

      resp =
        :cowboy_req.reply(
          conn.resp_code,
          conn.resp_header,
          conn.resp_body,
          req
        )

      {:ok, resp, state}
    end

    defp content_for(%Conn{req_path: "/"} = conn) do
      Conn.put_resp_body(conn, "Hello Erlang!")
    end

    defp content_for(%Conn{req_path: "/about"} = conn) do
      conn
      |> Conn.put_resp_body("""
      <h1>About Erlang</h1>
      <p>Erlang is amazing</P>
      """)
    end

    defp content_for(conn) do
      conn
      |> Conn.put_resp_code(404)
      |> Conn.put_resp_body("""
      <h1>Page not found</h1>
      <p>Error 404, page not found</p>
      """)
    end
  end

  def start_cowboy() do
    dispatch =
      :cowboy_router.compile([
        {:_, [{:_, PageHandler, []}]}
      ])

    case :cowboy.start_clear(:http, [port: 8080], %{env: %{dispatch: dispatch}}) do
      {:ok, pid} ->
        IO.puts("Cowboy is running at http://localhost:8080")

      _ ->
        IO.puts("An error occured when starting cowboy")
    end
  end
end
