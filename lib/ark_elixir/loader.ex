defmodule ArkElixir.Loader do
  @moduledoc """
  Documentation for ArkElixir.Loader.
  """

  import ArkElixir

  @doc """
  Get the blockchain status.

  ## Examples

      iex> ArkElixir.Loader.status(client)
      %{"blocksCount" => 0, "loaded" => false, "now" => 2346599, "success" => true}

  """
  @spec status(ArkElixir.Client) :: ArkElixir.response()
  def status(client) do
    get(client, 'api/loader/status')
  end

  @doc """
  Get the synchronisation status of the client.

  ## Examples

      iex> ArkElixir.Loader.sync(client)
      %{"blocks" => -13, "height" => 2492181, "id" => "7188317292059640668", "success" => true, "syncing" => false}

  """
  @spec sync(ArkElixir.Client) :: ArkElixir.response()
  def sync(client) do
    get(client, 'api/loader/status/sync')
  end

  @doc """
  Auto-configure the client loader.

  ## Examples

      iex> ArkElixir.Loader.autoconfigure(client)
      %{"network" => %{"explorer" => "http://dexplorer.ark.io", "nethash" => "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23", "symbol" => "DѦ", "token" => "DARK", "version" => 30}, "success" => true}

  """
  @spec autoconfigure(ArkElixir.Client) :: ArkElixir.response()
  def autoconfigure(client) do
    get(client, 'api/loader/autoconfigure')
  end
end
