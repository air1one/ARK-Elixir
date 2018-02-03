defmodule ArkElixir.Client do
  defstruct ip: nil, port: nil, nethash: nil, version: nil

  @type t :: %{ip: binary, port: binary, nethash: binary, version: binary}

  @spec new(t) :: t
  def new(server) do
    %__MODULE__{
      ip: server.ip,
      port: server.port,
      nethash: server.nethash,
      version: server.version
    }
  end
end