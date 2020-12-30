defmodule Toy.View do
  defmacro __using__(opts) do
    path = Keyword.fetch!(opts, :path)

    for templates <- Path.wildcard(path <> "/*.eex") do
      base_file_name = Path.basename(templates, ".eex")
      template_content = File.read!(templates)

      quote do
        def render(unquote(base_file_name), assigns) do
          EEx.eval_string(unquote(template_content), assigns)
        end
      end
    end
  end
end
