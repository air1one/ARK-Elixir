defmodule ArkElixir.AccountTest do
  use ExUnit.Case
  import ArkElixir.Account

  @client ArkElixir.Client.new(%{
            protocol: "https",
            ip: "dexplorer.ark.io",
            port: 8443,
            nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
            version: "1.1.1",
            network_address: ArkElixir.Client.devnet_network_address
          })

  @account "DLsCPHjjq1XL52hdHoJ91A56W7DR2faUu3"

  test "call ArkElixir.Account.balance" do
    response = balance(@client, @account)

    assert({:ok, _} = response)
  end

  test "call ArkElixir.Account.publickey" do
    response = publickey(@client, @account)

    assert({:ok, _} = response)
  end

  test "call ArkElixir.Account.fee" do
    response = fee(@client)

    assert({:ok, _} = response)
  end

  test "call ArkElixir.Account.delegates" do
    response = delegates(@client, @account)

    assert({:ok, _} = response)
  end

  test "call ArkElixir.Account.account" do
    response = account(@client, @account)

    assert({:ok, _} = response)
  end
end
