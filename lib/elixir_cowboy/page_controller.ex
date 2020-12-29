defmodule ElixirCowboy.PageController do
  use Toy.Controller

  alias Toy.Conn

  def home(conn, _params) do
    render(conn, "home.html", message: "Hello Erlang!")
  end

  def about(conn, _params) do
    render(conn, "about.html")
  end

  def render(conn, template_name, assigns \\ []) do
    body = ElixirCowboy.PageView.render(template_name, assigns)
    Conn.put_resp_body(conn, body)
  end
end
