defmodule ArkElixir.Loader do
  import ArkElixir

  def status(client) do
    get(client, 'api/loader/status')
  end

  def sync(client) do
    get(client, 'api/loader/status/sync')
  end

  def autoconfigure(client) do
    get(client, 'api/loader/autoconfigure')
  end
end
