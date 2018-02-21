defmodule ArkElixir.Client do
  @moduledoc """
  Documentation for ArkElixir.Client.
  """
  defstruct protocol: nil, ip: nil, port: nil, nethash: nil, version: nil, network_address: nil

  @type t :: %{
          protocol: binary,
          ip: binary,
          port: binary,
          nethash: binary,
          version: binary,
          network_address: binary
        }

  @mainnet_network_address <<0x17>>
  @devnet_network_address <<0x1e>>

  def mainnet_network_address, do: @mainnet_network_address
  def devnet_network_address, do: @devnet_network_address

  @doc """
  Create a new instance.

  ## Examples

      iex> ArkElixir.Client.new(client)
      :world

  """
  @spec new(t) :: t
  def new(server) do
    %__MODULE__{
      protocol: server.protocol,
      ip: server.ip,
      port: server.port,
      nethash: server.nethash,
      version: server.version,
      network_address: server.network_address
    }
  end
end
