defmodule ElixirCowboy.Router do
  alias Toy.Conn
  alias ElixirCowboy.PageController


  def call(conn) do
    content_for(conn, conn.req_path)
  end

  defp content_for(conn, "/") do
    PageController.call(conn, :home)
  end

  defp content_for(conn, "/about") do
    PageController.call(conn, :about)
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