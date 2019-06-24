defmodule MyappWeb.PageController do
  use MyappWeb.Web, :controller
  import Conduit.Message
  import TestStruct


  def index(conn, _params) do
    id = Map.fetch!(_params, "id")
    body = id
    message = %Conduit.Message{}
    |> put_body(body)
    opts = []
    MyappWebQueue.Broker.publish(message, :message, opts)
    json(conn, %{userId: id})
  end
end
