defmodule ArkElixir.Client do
  @moduledoc """
  Documentation for ArkElixir.Client.
  """
  defstruct protocol: nil, ip: nil, port: nil, nethash: nil, version: nil, arkjs: nil

  @type t :: %{protocol: binary, ip: binary, port: binary, nethash: binary, version: binary, arkjs: binary}

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Client.block
      :world

  """
  @spec new(t) :: t
  def new(server) do
    %__MODULE__{
      protocol: sever.protocol,
      ip: server.ip,
      port: server.port,
      nethash: server.nethash,
      version: server.version,
      arkjs: server.arkjs
    }
  end
end
