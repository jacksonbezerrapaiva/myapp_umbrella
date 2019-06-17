defmodule MyappWeb.PageControllerTest do
  use MyappWeb.ConnCase

  test "test endpoint post /" do
    conn = post(build_conn(), "/", ["id": 1])
    body = json_response(conn, 200)
    assert (body["userId"] == 1)
  end

end
