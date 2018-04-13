defmodule ArkElixir.Peer do
  @moduledoc """
  Documentation for ArkElixir.Peer.
  """

  import ArkElixir

  alias ArkElixir.Models.Peer

  @doc """
  Get a single peer.

  ## Examples

      iex> ArkElixir.Peer.peer(client, "167.114.29.35", 4002)
      {:ok,
       %ArkElixir.Models.Peer{
         delay: 85,
         errors: 0,
         height: 3102404,
         ip: "167.114.29.35",
         os: "linux4.4.0-109-generic",
         port: 4002,
         status: "OK",
         version: "1.1.1"
       }}
  """
  @spec peer(Tesla.Client.t(), String.t(), Integer.t()) :: ArkElixir.response()
  def peer(client, ip, port) do
    client
    |> get("api/peers/get", query: [ip: ip, port: port])
    |> handle_response
  end

  @doc """
  Get all peers.

  ## Examples

      iex> ArkElixir.Peer.peers(client)
      {:ok,
       [
         %ArkElixir.Models.Peer{
           delay: 93,
           errors: 0,
           height: 3102404,
           ip: "167.114.29.35",
           os: "linux4.4.0-109-generic",
           port: 4002,
           status: "OK",
           version: "1.1.1"
         },
         %ArkElixir.Models.Peer{delay: 210, errors: 0, height: 3102404, ...},
         %ArkElixir.Models.Peer{delay: 360, errors: 0, ...},
         %ArkElixir.Models.Peer{delay: 182, ...},
         %ArkElixir.Models.Peer{...},
         ...
       ]}
  """
  @spec peers(Tesla.Client.t(), Keyword.t()) :: ArkElixir.response()
  def peers(client, parameters \\ []) do
    client
    |> get("api/peers", query: parameters)
    |> handle_response
  end

  @doc """
  Get the peer version.

  ## Examples

      iex> ArkElixir.Peer.version(client)
      {:ok, "1.1.1"}
  """
  @spec version(Tesla.Client.t()) :: ArkElixir.response()
  def version(client) do
    get(client, "api/peers/version")
    client
    |> get("api/peers/version")
    |> case do
      {:ok, %{"version" => version, "success" => true}} -> {:ok, version}
      {:ok, invalid_response} -> {:error, invalid_response}
      {:error, _message} = error -> error
    end
  end

  # private

  defp handle_response({:ok, %{"peer" => peer, "success" => true}}) do
    {:ok, Peer.build(peer)}
  end

  defp handle_response({:ok, %{"peers" => peers, "success" => true}}) do
    {:ok, Enum.map(peers, &Peer.build/1)}
  end

  defp handle_response({:ok, invalid_response}) do
    {:error, invalid_response}
  end

  defp handle_response({:error, _error} = response) do
    response
  end
end
