defmodule ElixirCowboy.PageController do
  use Toy.Controller

  alias Toy.Conn

  def home(conn, _params) do
    Conn.put_resp_body(conn, "Hello Erlang!")
  end

  def about(conn, _params) do
  conn
  |> Conn.put_resp_body("""
  <h1>About Erlang</h1>
  <p>Erlang is amazing</P>
  """)
  end
end