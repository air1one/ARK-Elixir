defmodule ArkElixir.Peer do
  import ArkElixir

  def peer(client, ip, port) do
    get(client, 'api/peers/get', %{ip: ip, port: port})
  end

  def peers(client, params \\ []) do
    get(client, 'api/peers', params)
  end

  def version(client) do
    get(client, 'api/peers/version')
  end
end
