defmodule ArkElixir.Peer do
  @moduledoc """
  Documentation for ArkElixir.Peer.
  """

  import ArkElixir

  @doc """
  Get a single peer.

  ## Examples

      iex> ArkElixir.Peer.peer
      :world

  """
  @spec peer(ArkElixir.Client, String.t(), Integer.t()) :: ArkElixir.response()
  def peer(client, ip, port) do
    get(client, 'api/peers/get', %{ip: ip, port: port})
  end

  @doc """
  Get all peers.

  ## Examples

      iex> ArkElixir.Peer.peers
      :world

  """
  @spec peers(ArkElixir.Client, Keyword.t()) :: ArkElixir.response()
  def peers(client, parameters \\ []) do
    get(client, 'api/peers', parameters)
  end

  @doc """
  Get the peer version.

  ## Examples

      iex> ArkElixir.Peer.version
      :world

  """
  @spec version(ArkElixir.Client) :: ArkElixir.response()
  def version(client) do
    get(client, 'api/peers/version')
  end
end
