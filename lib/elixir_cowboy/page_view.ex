defmodule ElixirCowboy.PageView do
  def redner("home.html", assigns) do
    template = """
      <h1> Welcome </h1>
      <%= message %>
    """

    EEx.eval_string(template, assigns)
  end

  def render("about.html", assigns) do
    template = """
    <h1>About Erlang</h1>
    <p>Erlang is amazing</P>
    """

    EEx.eval_string(template, assigns)
  end
end
