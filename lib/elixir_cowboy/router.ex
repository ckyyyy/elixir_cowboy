defmodule ElixirCowboy.Router do
  use Toy.Router

  alias Toy.Conn
  alias ElixirCowboy.PageController

  def content_for(conn, "/") do
    PageController.call(conn, :home)
  end

  def content_for(conn, "/about") do
    PageController.call(conn, :about)
  end

  def content_for(conn, _) do
    conn
    |> Conn.put_resp_code(404)
    |> Conn.put_resp_body("""
    <h1>Page not found</h1>
    <p>Error 404, page not found</p>
    """)
  end
end