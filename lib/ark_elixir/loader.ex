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
  def status(client) do
    get(client, 'api/loader/status')
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Loader.sync
      :world

  """
  def sync(client) do
    get(client, 'api/loader/status/sync')
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Loader.autoconfigure
      :world

  """
  def autoconfigure(client) do
    get(client, 'api/loader/autoconfigure')
  end
end
