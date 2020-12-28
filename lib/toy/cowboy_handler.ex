defmodule Toy.CowboyHandler do
  def init(req, router) do
    conn =
      %Toy.Conn{req_path: :cowboy_req.path(req)}
      |> router.call()

    resp =
      :cowboy_req.reply(
        conn.resp_code,
        conn.resp_header,
        conn.resp_body,
        req
      )

    {:ok, resp, router}
  end
end
