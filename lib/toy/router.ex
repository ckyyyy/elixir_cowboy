defmodule Toy.Router do
  defmacro __using__(_opts) do
    quote do
      def call(conn) do
        content_for(conn, conn.req_path)
      end
    end
  end
end