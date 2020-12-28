defmodule ElixirCowboy.Router do
  use Toy.Router

  alias Toy.Conn
  alias ElixirCowboy.PageController

  get("/", PageController, :home)
  get("/about", PageController, :about)

  def content_for(conn, _) do
    conn
    |> Conn.put_resp_code(404)
    |> Conn.put_resp_body("""
    <h1>Page not found</h1>
    <p>Error 404, page not found</p>
    """)
  end
end
