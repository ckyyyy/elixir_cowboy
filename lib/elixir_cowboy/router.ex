defmodule ElixirCowboy.Router do
  alias Toy.Conn

  def call(conn) do
    content_for(conn, conn.req_path)
  end

  defp content_for(conn, "/") do
    Conn.put_resp_body(conn, "Hello Erlang!")
  end

  defp content_for(conn, "/about") do
    conn
    |> Conn.put_resp_body("""
    <h1>About Erlang</h1>
    <p>Erlang is amazing</P>
    """)
  end

  defp content_for(conn, _) do
    conn
    |> Conn.put_resp_code(404)
    |> Conn.put_resp_body("""
    <h1>Page not found</h1>
    <p>Error 404, page not found</p>
    """)
  end
end