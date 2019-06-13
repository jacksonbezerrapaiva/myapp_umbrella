defmodule MyappWeb.PageController do
  use MyappWeb.Web, :controller

  def index(conn, _params) do
    id = Map.fetch!(_params,"id")
    json(conn, %{userId: id})
  end
end
