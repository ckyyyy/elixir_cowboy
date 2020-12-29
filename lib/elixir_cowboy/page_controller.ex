defmodule ElixirCowboy.PageController do
  use Toy.Controller

  def home(conn, _params) do
    render(conn, "home.html", message: "Hello Erlang!")
  end

  def about(conn, _params) do
    render(conn, "about.html")
  end
end
