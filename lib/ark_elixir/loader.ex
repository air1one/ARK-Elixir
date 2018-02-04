defmodule ArkElixir.Loader do
  @moduledoc """
  Documentation for ArkElixir.Loader.
  """

  import ArkElixir

  @doc """
  Get the blockchain status.

  ## Examples

      iex> ArkElixir.Loader.status
      :world

  """
  @spec status(ArkElixir.Client) :: ArkElixir.response()
  def status(client) do
    get(client, 'api/loader/status')
  end

  @doc """
  Get the synchronisation status of the client.

  ## Examples

      iex> ArkElixir.Loader.sync
      :world

  """
  @spec sync(ArkElixir.Client) :: ArkElixir.response()
  def sync(client) do
    get(client, 'api/loader/status/sync')
  end

  @doc """
  Auto-configure the client loader.

  ## Examples

      iex> ArkElixir.Loader.autoconfigure
      :world

  """
  @spec autoconfigure(ArkElixir.Client) :: ArkElixir.response()
  def autoconfigure(client) do
    get(client, 'api/loader/autoconfigure')
  end
end
