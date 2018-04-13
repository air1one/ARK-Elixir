defmodule ArkElixir.BlockTest do
  use ExUnit.Case
  import ArkElixir.Block

  @client ArkElixir.Client.new(%{
            protocol: "https",
            ip: "dexplorer.ark.io",
            port: 8443,
            nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
            version: "1.1.1",
            network_address: ArkElixir.Client.devnet_network_address
          })

  test "call ArkElixir.Block.block" do
    response = block(@client, "16881146789693253434")

    assert({:ok, _} = response)
  end

  test "call ArkElixir.Block.blocks" do
    response = blocks(@client)

    assert({:ok, _} = response)
  end

  test "call ArkElixir.Block.epoch" do
    response = epoch(@client)

    assert({:ok, _} = response)
  end

  test "call ArkElixir.Block.height" do
    response = height(@client)

    assert({:ok, _} = response)
  end

  test "call ArkElixir.Block.nethash" do
    response = nethash(@client)

    assert({:ok, _} = response)
  end

  test "call ArkElixir.Block.fee" do
    response = fee(@client)

    assert({:ok, _} = response)
  end

  test "call ArkElixir.Block.fees" do
    response = fees(@client)

    assert({:ok, _} = response)
  end

  test "call ArkElixir.Block.milestone" do
    response = milestone(@client)

    assert({:ok, _} = response)
  end

  test "call ArkElixir.Block.reward" do
    response = reward(@client)

    assert({:ok, _} = response)
  end

  test "call ArkElixir.Block.supply" do
    response = supply(@client)

    assert({:ok, _} = response)
  end

  test "call ArkElixir.Block.status" do
    response = status(@client)

    assert({:ok, _} = response)
  end
end
