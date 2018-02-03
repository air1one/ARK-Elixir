defmodule ArkElixir.PeerTest do
  use ExUnit.Case
  import ArkElixir.Peer

  @client ArkElixir.Client.new(%{
            ip: "127.0.0.1",
            port: 4002,
            nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
            version: "1.1.1",
            arkjs: "/usr/local/lib/node_modules/arkjs"
          })

  test "call peer" do
    response = peer(@client, "167.114.29.33", 4002)

    assert(response["success"] === true)
  end

  test "call peers" do
    response = peers(@client)

    assert(response["success"] === true)
  end

  test "call version" do
    response = version(@client)

    assert(response["success"] === true)
  end
end
