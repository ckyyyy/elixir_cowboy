defmodule Toy.Controller do
  defmacro __using__(_opts) do
    quote do
      def call(conn, action) do
        apply(__MODULE__, action, [conn, %{}])
      end
    end
  end
end