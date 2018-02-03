defmodule ArkElixir.Peer do
  @moduledoc """
  Documentation for ArkElixir.Peer.
  """

  import ArkElixir

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Peer.peer
      :world

  """
  def peer(client, ip, port) do
    get(client, 'api/peers/get', %{ip: ip, port: port})
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Peer.peers
      :world

  """
  def peers(client, params \\ []) do
    get(client, 'api/peers', params)
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Peer.version
      :world

  """
  def version(client) do
    get(client, 'api/peers/version')
  end
end
