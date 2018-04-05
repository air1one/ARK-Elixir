defmodule ArkElixir.Client do
  @moduledoc """
  Documentation for ArkElixir.Client.

  This module generates a Tesla.Client for use in future requests. Feel free
  to make your own Tesla Client struct and pass that around.
  """
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
  @spec new(Map.t) :: Tesla.Client.t
  def new(%{
    nethash: nethash,
    network_address: network_address,
    url: url,
    version: version
  })
  when is_bitstring(nethash)
  and is_bitstring(network_address)
  and is_bitstring(url)
  and is_bitstring(version) do
    headers = [
      {"Content-Type", "application/json"},
      {"nethash", nethash},
      {"version", version},
      {"port", 1}
    ]

    pre = [
      {Tesla.Middleware.BaseUrl, [url]},
      {Tesla.Middleware.Logger, []},
      {Tesla.Middleware.Headers, headers},
      {Tesla.Middleware.JSON, []}
    ]

    Tesla.build_client(pre)
  end

  def new(%{ip: ip, port: port, protocol: protocol} = opts) do
    opts
    |> Map.drop([:ip, :port, :protocol])
    |> Map.put(:url, "#{protocol}://#{ip}:#{port}")
    |> new
  end

  def new(_invalid) do
    :error
  end
end
