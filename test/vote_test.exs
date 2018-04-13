defmodule ArkElixir.VoteTest do
  use ExUnit.Case
  import ArkElixir.Vote

  @client ArkElixir.Client.new(%{
            protocol: "https",
            ip: "dexplorer.ark.io",
            port: 8443,
            nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
            version: "1.1.1",
            network_address: ArkElixir.Client.devnet_network_address
          })

  @tag :skip
  test "call ArkElixir.Vote.vote" do
    response =
      vote(
        @client,
        'recipientId',
        '100000000',
        'vendorField'
      )

    assert(response["success"] === true)
  end

  @tag :skip
  test "call ArkElixir.Vote.unvote" do
    response =
      unvote(
        @client,
        'recipientId',
        '100000000',
        'vendorField'
      )

    assert(response["success"] === true)
  end
end
