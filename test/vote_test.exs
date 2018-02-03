defmodule ArkElixir.VoteTest do
  use ExUnit.Case
  import ArkElixir.Vote

  @client ArkElixir.Client.new(%{
            protocol: "https",
            ip: "127.0.0.1",
            port: 4002,
            nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
            version: "1.1.1",
            arkjs: "/usr/local/lib/node_modules/arkjs"
          })
end
