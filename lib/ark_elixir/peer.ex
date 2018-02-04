defmodule ArkElixir.Peer do
  @moduledoc """
  Documentation for ArkElixir.Peer.
  """

  import ArkElixir

  @doc """
  Get a single peer.

  ## Examples

      iex> ArkElixir.Peer.peer(client)
      %{"peer" => %{"delay" => 180, "errors" => 0, "height" => 2492141, "ip" => "167.114.29.33", "os" => "linux4.4.0-109-generic", "port" => 4002, "status" => "OK", "version" => "1.1.1"}, "success" => true}

  """
  @spec peer(ArkElixir.Client, String.t(), Integer.t()) :: ArkElixir.response()
  def peer(client, ip, port) do
    get(client, 'api/peers/get', %{ip: ip, port: port})
  end

  @doc """
  Get all peers.

  ## Examples

      iex> ArkElixir.Peer.peers(client)
      %{"peers" => [%{"delay" => 156, "errors" => 0, "height" => 2492160, "ip" => "45.33.86.168", "os" => "linux4.14.14-x86_64-linode94", "port" => 4002, "status" => "OK", "version" => "1.1.1"}, %{"delay" => 168, "errors" => 0, "height" => 2470987, "ip" => "192.99.91.207", "os" => "linux4.4.0-101-generic", "port" => 4002, "status" => "OK", "version" => "1.1.1"}, %{"delay" => 23, "errors" => 0, "height" => 2492160, "ip" => "185.177.21.72", "os" => "linux4.10.0-37-generic", "port" => 4002, "status" => "OK", "version" => "1.1.1"}, %{"delay" => 41, "errors" => 0, "height" => 2492160, "ip" => "45.32.150.183", "os" => "linux4.4.0-112-generic", "port" => 4002, "status" => "OK", "version" => "1.1.1"}, %{"delay" => 86, "errors" => 0, "height" => 1843813, "ip" => "164.8.251.172", "os" => "linux4.10.0-42-generic", "port" => 4002, "status" => "OK", "version" => "1.1.1"}, %{"delay" => 168, "errors" => 0, "height" => 2492107, "ip" => "167.114.29.39", "os" => "linux4.4.0-109-generic", "port" => 4002, "status" => "OK", "version" => "1.1.1"}, %{"delay" => 18, "errors" => 0, "height" => 2492161, "ip" => "145.239.75.25", "os" => "linux4.4.0-112-generic", "port" => 4002, "status" => "OK", "version" => "1.1.1"}, %{"delay" => 172, "errors" => 0, "height" => 2492160, "ip" => "138.197.165.165", "os" => "linux4.4.0-98-generic", "port" => 4002, "status" => "OK", "version" => "1.1.1"}, %{"delay" => 218, "errors" => 0, "height" => 2492159, "ip" => "73.72.227.2", "os" => "linux4.13.0-32-generic", "port" => 4002, "status" => "OK", "version" => "1.1.1"}, %{"delay" => 615, "errors" => 0, "height" => 2492160, "ip" => "108.61.169.37", "os" => "linux4.10.0-42-generic", "port" => 4002, "status" => "OK", "version" => "1.1.1"}, %{"delay" => 166, "errors" => 0, "height" => 2492113, "ip" => "167.114.29.53", "os" => "linux4.4.0-79-generic", "port" => 4002, "status" => "OK", "version" => "1.1.1"}, %{"delay" => 165, "errors" => 0, "height" => 2492141, "ip" => "167.114.29.37", "os" => "linux4.4.0-109-generic", "port" => 4002, "status" => "OK", "version" => "1.1.1"}, %{"delay" => 169, "errors" => 0, "height" => 2492162, "ip" => "167.114.29.51", "os" => "linux4.4.0-109-generic", "port" => 4002, "status" => "OK", "version" => "1.1.1"}, %{"delay" => 499, "errors" => 0, "height" => 1952901, "ip" => "43.224.34.53", "os" => "linux4.10.0-33-generic", "port" => 4002, "status" => "OK", "version" => "1.1.0"}, %{"delay" => 56, "errors" => 0, "height" => 2492159, "ip" => "108.61.209.209", "os" => "linux4.4.0-109-generic", "port" => 4002, "status" => "OK", "version" => "1.1.1"}, %{"delay" => 166, "errors" => 0, "height" => 2492160, "ip" => "167.114.29.55", "os" => "linux4.4.0-79-generic", "port" => 4002, "status" => "OK", "version" => "1.1.1"}, %{"delay" => 12, "errors" => 0, "height" => 2492114, "ip" => "137.74.47.141", "os" => "linux4.4.0-109-generic", "port" => 4002, "status" => "OK", "version" => "1.1.1"}, %{"delay" => 39, "errors" => 1, "height" => 2492160, "ip" => "185.207.107.107", "os" => "linux4.4.0-109-generic", "port" => 4000, "status" => "OK", "version" => "1.1.1"}, %{"delay" => 8, "errors" => 0, "height" => 2492102, "ip" => "213.32.9.98", "os" => "linux4.4.0-104-generic", "port" => 4002, "status" => "OK", "version" => "1.1.1"}, %{"delay" => 34, "errors" => 0, "height" => 2492107, "ip" => "193.70.1.222", "os" => "linux4.4.0-112-generic", "port" => 4002, "status" => "OK", "version" => "1.1.1"}, %{"delay" => 27, "errors" => 0, "height" => 2492116, "ip" => "178.32.227.48", "os" => "linux4.4.0-109-generic", "port" => 4002, "status" => "OK", "version" => "1.1.1"}, %{"delay" => 15, "errors" => 0, "height" => 2492107, "ip" => "45.76.136.154", "os" => "linux4.4.0-109-generic", "port" => 4002, "status" => "OK", "version" => "1.1.1"}, %{"delay" => 157, "errors" => 0, "height" => 1984751, "ip" => "104.236.122.76", "os" => "linux4.4.0-109-generic", "port" => 4002, "status" => "OK", "version" => "1.1.1"}, %{"delay" => 153, "errors" => 0, "height" => 2340142, "ip" => "45.77.154.237", "os" => "linux4.4.0-109-generic", "port" => 4002, "status" => "OK", "version" => "1.1.1"}, %{"delay" => 22, "errors" => 0, "height" => 2492141, "ip" => "209.250.228.98", "os" => "linux4.4.0-109-generic", "port" => 4002, "status" => "OK", "version" => "1.1.1"}, %{"delay" => 169, "errors" => 0, "height" => 2492155, "ip" => "167.114.29.41", "os" => "linux4.4.0-109-generic", "port" => 4002, "status" => "OK", "version" => "1.1.1"}, %{"delay" => 33, "errors" => 0, "height" => 2492160, "ip" => "108.61.171.169", "os" => "linux4.4.0-109-generic", "port" => 4002, "status" => "OK", "version" => "1.1.1"}, %{"delay" => 199, "errors" => 0, "height" => 2492142, "ip" => "62.113.246.106", "os" => "linux2.6.32-042stab127.2", "port" => 4002, "status" => "OK", "version" => "1.1.1"}, %{"delay" => 165, "errors" => 0, "height" => 2492121, "ip" => "167.114.29.36", "os" => "linux4.4.0-109-generic", "port" => 4002, "status" => "OK", "version" => "1.1.1"}, %{"delay" => 58, "errors" => 0, "height" => 2492118, "ip" => "94.177.218.138", "os" => "linux4.4.0-109-generic", "port" => 4002, "status" => "OK", "version" => "1.1.1"}, %{"delay" => 305, "errors" => 0, "height" => 2492156, "ip" => "138.197.206.43", "os" => "linux4.4.0-93-generic", "port" => 4002, "status" => "OK", "version" => "1.1.1"}, %{"delay" => 167, "errors" => 0, "height" => 2492162, "ip" => "167.114.29.52", "os" => "linux4.4.0-79-generic", "port" => 4002, "status" => "OK", "version" => "1.1.1"}, %{"delay" => 198, "errors" => 0, "height" => 2492160, "ip" => "104.238.165.129", "os" => "linux4.4.0-109-generic", "port" => 4002, "status" => "OK", "version" => "1.1.1"}, %{"delay" => 211, "errors" => 0, "height" => 2492160, "ip" => "130.211.155.75", "os" => "linux4.13.0-25-generic", "port" => 4002, "status" => "OK", "version" => "1.1.1"}, %{"delay" => 104, "errors" => 0, "height" => 2345026, "ip" => "164.8.251.184", "os" => "linux4.10.0-42-generic", "port" => 4002, "status" => "OK", "version" => "1.1.1"}, %{"delay" => 23, "errors" => 0, "height" => 2492091, "ip" => "45.76.142.128", "os" => "linux4.4.0-109-generic", "port" => 4002, "status" => "OK", "version" => "1.1.1"}, %{"delay" => 168, "errors" => 0, "height" => 2492113, "ip" => "167.114.29.34", "os" => "linux4.4.0-109-generic", "port" => 4002, "status" => "OK", "version" => "1.1.1"}, %{"delay" => 167, "errors" => 0, "height" => 2492160, "ip" => "167.114.29.32", "os" => "linux4.4.0-109-generic", "port" => 4002, "status" => "OK", "version" => "1.1.1"}, %{"delay" => 69, "errors" => 0, "height" => 2492118, "ip" => "45.77.60.133", "os" => "linux4.4.0-93-generic", "port" => 4002, "status" => "OK", "version" => "1.1.1"}, %{"delay" => 231, "errors" => 0, "height" => 2492091, "ip" => "173.208.187.49", "os" => "linux4.4.0-104-generic", "port" => 4002, "status" => "OK", "version" => "1.1.1"}, %{"delay" => 169, "errors" => 0, "height" => 2492095, "ip" => "167.114.29.42", "os" => "linux4.4.0-109-generic", "port" => 4002, "status" => "OK", "version" => "1.1.0"}, %{"delay" => 37, "errors" => 0, "height" => 2492161, "ip" => "35.198.128.164", "os" => "linux4.13.0-1008-gcp", "port" => 4002, "status" => "OK", ...}, %{"delay" => 40, "errors" => 0, "height" => 2492155, "ip" => "45.76.39.61", "os" => "linux4.4.0-112-generic", "port" => 4002, ...}, %{"delay" => 153, "errors" => 0, "height" => 2492095, "ip" => "45.55.50.124", "os" => "linux4.4.0-104-generic", ...}, %{"delay" => 164, "errors" => 0, "height" => 2492160, "ip" => "167.114.29.35", ...}, %{"delay" => 286, "errors" => 0, "height" => 2492116, ...}, %{"delay" => 8, "errors" => 0, ...}, %{"delay" => 303, ...}, %{...}, ...], "success" => true}

  """
  @spec peers(ArkElixir.Client, Keyword.t()) :: ArkElixir.response()
  def peers(client, parameters \\ []) do
    get(client, 'api/peers', parameters)
  end

  @doc """
  Get the peer version.

  ## Examples

      iex> ArkElixir.Peer.version(client)
      %{"build" => "", "success" => true, "version" => "1.1.1"}

  """
  @spec version(ArkElixir.Client) :: ArkElixir.response()
  def version(client) do
    get(client, 'api/peers/version')
  end
end
