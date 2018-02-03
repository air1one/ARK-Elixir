defmodule ArkElixir.Loader do
  @moduledoc """
  Documentation for ArkElixir.Loader.
  """

  import ArkElixir

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Loader.status
      :world

  """
  @spec status(ArkElixir.http(), ArkElixir.parameters()) :: ArkElixir.response()
  def status(client) do
    get(client, 'api/loader/status')
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Loader.sync
      :world

  """
  @spec sync(ArkElixir.http(), ArkElixir.parameters()) :: ArkElixir.response()
  def sync(client) do
    get(client, 'api/loader/status/sync')
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Loader.autoconfigure
      :world

  """
  @spec autoconfigure(ArkElixir.http(), ArkElixir.parameters()) :: ArkElixir.response()
  def autoconfigure(client) do
    get(client, 'api/loader/autoconfigure')
  end
end
