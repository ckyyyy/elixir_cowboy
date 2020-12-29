defmodule ElixirCowboy.Router do
  use Toy.Router

  alias Toy.Conn
  alias ElixirCowboy.PageController
  alias ElixirCowboy.ContactController

  get("/", PageController, :home)
  get("/about", PageController, :about)
  get("/contact", ContactController, :contact)
end
