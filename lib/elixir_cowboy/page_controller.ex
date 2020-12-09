defmodule ElixirCowboy.PageController do
  alias Toy.Conn

  def call(conn, action) do
    apply(__MODULE__, action, [conn, %{}])
  end

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