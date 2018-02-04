defmodule ArkElixir.TransportTest do
  use ExUnit.Case
  import ArkElixir.Transport

  @client ArkElixir.Client.new(%{
            protocol: "https",
            ip: "dexplorer.ark.io",
            port: 8443,
            nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
            version: "1.1.1",
            arkjs: "/usr/local/lib/node_modules/arkjs"
          })

  @tag :skip
  test "call ArkElixir.Transport.list" do
    response = list(@client)

    assert(response["success"] === true)
  end

  @tag :skip
  test "call ArkElixir.Transport.blocks_common" do
    response =
      blocks_common(
        @client,
        'recipientId'
      )

    assert(response["success"] === true)
  end

  @tag :skip
  test "call ArkElixir.Transport.block" do
    response =
      block(
        @client,
        'recipientId'
      )

    assert(response["success"] === true)
  end

  @tag :skip
  test "call ArkElixir.Transport.blocks" do
    response = blocks(@client)

    assert(response["success"] === true)
  end

  @tag :skip
  test "call ArkElixir.Transport.create_block" do
    response =
      create_block(
        @client,
        'recipientId'
      )

    assert(response["success"] === true)
  end

  @tag :skip
  test "call ArkElixir.Transport.transactions" do
    response = transactions(@client)

    assert(response["success"] === true)
  end

  @tag :skip
  test "call ArkElixir.Transport.transactions_from_ids" do
    response =
      transactions_from_ids(
        @client,
        'recipientId'
      )

    assert(response["success"] === true)
  end

  @tag :skip
  test "call ArkElixir.Transport.create_transactions" do
    response =
      create_transactions(
        @client,
        'recipientId'
      )

    assert(response["success"] === true)
  end

  @tag :skip
  test "call ArkElixir.Transport.height" do
    response = height(@client)

    assert(response["success"] === true)
  end

  @tag :skip
  test "call ArkElixir.Transport.status" do
    response = status(@client)

    assert(response["success"] === true)
  end
end
