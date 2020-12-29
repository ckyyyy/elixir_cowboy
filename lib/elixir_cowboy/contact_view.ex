defmodule ElixirCowboy.ContactView do
  def render("contact.html", assigns) do
    template = """
    <h1>Contact Us</h1>
    <p>Free feel to contact us.</p>
    """

    EEx.eval_string(template, assigns)
  end
end
