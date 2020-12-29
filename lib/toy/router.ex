defmodule Toy.Router do
  defmacro __using__(_opts) do
    quote do
      import Toy.Router
      @before_compile Toy.Router

      def call(conn) do
        content_for(conn, conn.req_path)
      end
    end
  end

  defmacro __before_compile__(_env) do
    quote do
      def content_for(conn, _) do
        conn
        |> Toy.Conn.put_resp_code(404)
        |> Toy.Conn.put_resp_body("""
          <h1>Page not found</h1>
          <p>Error 404, page not found</p>
          """)
      end 
    end
  end

  defmacro get(path, controller, action) do
    quote do
      def content_for(conn, unquote(path)) do
        apply(unquote(controller), :call, [conn, unquote(action)])
      end
    end
  end
end
