defmodule ArkElixir.DelegateTest do
  use ExUnit.Case
  import ArkElixir.Delegate

  @client ArkElixir.Client.new(%{
            protocol: "https",
            ip: "127.0.0.1",
            port: 4002,
            nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
            version: "1.1.1",
            arkjs: "/usr/local/lib/node_modules/arkjs"
          })

  test "call ArkElixir.Delegate.count" do
    response = count(@client)

    assert(response["success"] === true)
  end

  test "call ArkElixir.Delegate.search" do
    response = search(@client, "bold", limit: 2)

    assert(response["success"] === true)
  end

  test "call ArkElixir.Delegate.voters" do
    response =
      voters(@client, "022cca9529ec97a772156c152a00aad155ee6708243e65c9d211a589cb5d43234d")

    assert(response["success"] === true)
  end

  test "call ArkElixir.Delegate.delegate" do
    response =
      delegate(
        @client,
        publicKey: "022cca9529ec97a772156c152a00aad155ee6708243e65c9d211a589cb5d43234d"
      )

    assert(response["success"] === true)
  end

  test "call ArkElixir.Delegate.delegates" do
    response = delegates(@client)

    assert(response["success"] === true)
  end

  test "call ArkElixir.Delegate.fee" do
    response = fee(@client)

    assert(response["success"] === true)
  end

  test "call ArkElixir.Delegate.forged_by_account" do
    response =
      forged_by_account(
        @client,
        "022cca9529ec97a772156c152a00aad155ee6708243e65c9d211a589cb5d43234d"
      )

    assert(response["success"] === true)
  end

  # test "call ArkElixir.Delegate.create" do
  #   response = create(@client, "secret", "username", "secondSecret")

  #   assert(response["success"] === true)
  # end
  test "call ArkElixir.Delegate.next_forgers" do
    response = next_forgers(@client)

    assert(response["success"] === true)
  end

  # test "call ArkElixir.Delegate.enable_forging" do
  #   response = enable_forging(@client, "secret")

  #   assert(response["success"] === true)
  # end

  # test "call ArkElixir.Delegate.disable_forging" do
  #   response = disable_forging(@client, "secret")

  #   assert(response["success"] === true)
  # end
  test "call ArkElixir.Delegate.forging_status" do
    response =
      forging_status(
        @client,
        "022cca9529ec97a772156c152a00aad155ee6708243e65c9d211a589cb5d43234d"
      )

    assert(response["success"] === true)
  end
end
