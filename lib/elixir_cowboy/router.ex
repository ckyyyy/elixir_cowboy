defmodule ElixirCowboy.Router do
  use Toy.Router

  alias Toy.Conn
  alias ElixirCowboy.PageController

  get("/", PageController, :home)
  get("/about", PageController, :about)
end
