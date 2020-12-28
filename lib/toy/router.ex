defmodule Toy.Router do
  defmacro __using__(_opts) do
    quote do
      import Toy.Router

      def call(conn) do
        content_for(conn, conn.req_path)
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
