defmodule ApiStart.RouterTest do
  use ExUnit.Case, async: true

  use Plug.Test

  @opts ApiStart.Router.init([])

  test "return ok" do
    build_conn = conn(:get, "/")
    conn = ApiStart.Router.call(build_conn, @opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "OK"
  end

  test "welcome home" do
    build_conn = conn(:get, "/home")
    conn = ApiStart.Router.call(build_conn, @opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "Welcome Home"
  end


end
