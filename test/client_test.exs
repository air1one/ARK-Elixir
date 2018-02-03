defmodule ArkElixir.ClientTest do
  use ExUnit.Case

  test "create ArkElixir.Client" do
    client =
      ArkElixir.Client.new(%{
        ip: '127.0.0.1',
        port: 4002,
        nethash: '578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23',
        version: '1.1.1',
        arkjs: '/usr/local/lib/node_modules/arkjs'
      })

    assert client.ip == '127.0.0.1'
    assert client.port == 4002
    assert client.nethash == '578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23'
    assert client.version == '1.1.1'
    assert client.arkjs == '/usr/local/lib/node_modules/arkjs'
  end
end
