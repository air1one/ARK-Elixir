defmodule ArkElixir.ClientTest do
  use ExUnit.Case

  test "create ArkElixir.Client" do
    client =
      ArkElixir.Client.new(%{
        protocol: "https",
        ip: 'dexplorer.ark.io',
        port: 8443,
        nethash: '578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23',
        version: '1.1.1',
        arkjs: '/usr/local/lib/node_modules/arkjs'
      })

    assert client.protocol == 'http'
    assert client.ip == 'dexplorer.ark.io'
    assert client.port == 8443
    assert client.nethash == '578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23'
    assert client.version == '1.1.1'
    assert client.arkjs == '/usr/local/lib/node_modules/arkjs'
  end
end
