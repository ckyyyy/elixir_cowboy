defmodule ElixirCowboy.ContactController do
  use Toy.Controller

  def contact(conn, _params) do
    render(conn, "contact.html")
  end
end
