defmodule ArkElixir do
  @moduledoc """
  Documentation for ArkElixir.
  """

  use HTTPoison.Base
  alias ArkElixir.Client

  @type response :: %{String.t() => any}

  @doc """
  Sends an HTTP GET request to a node.

  ## Examples

      iex> ArkElixir.get(client)
      :world

  """
  @spec get(ArkElixir.Client, String.t(), Keyword.t()) :: response
  def get(client, path, parameters) do
    response =
      HTTPoison.get!(
        build_url(client, path) <> build_query(parameters),
        build_headers(client)
      )

    Poison.decode!(response.body)
  end

  @doc """
  Sends an HTTP POST request to a node.

  ## Examples

      iex> ArkElixir.post(client)
      :world

  """
  @spec post(ArkElixir.Client, String.t(), Keyword.t()) :: response
  def post(client, path, parameters) do
    payload = Poison.encode!(parameters)

    response =
      HTTPoison.post!(
        build_url(client, path),
        payload,
        build_headers(client)
      )

    Poison.decode!(response.body)
  end

  @doc """
  Sends an HTTP PUT request to a node.

  ## Examples

      iex> ArkElixir.put(client)
      :world

  """
  @spec put(ArkElixir.Client, String.t(), Keyword.t()) :: response
  def put(client, path, parameters) do
    payload = Poison.encode!(parameters)

    response =
      HTTPoison.put!(
        build_url(client, path),
        payload,
        build_headers(client)
      )

    Poison.decode!(response.body)
  end

  @doc """
  Build an URL based on the ArkElixir.Client.

  ## Examples

      iex> ArkElixir.build_url(client)
      :world

  """
  @spec build_url(ArkElixir.Client, String.t()) :: response
  defp build_url(client, path) do
    "#{client.protocol}://#{client.ip}:#{client.port}/#{path}"
  end

  @doc """
  Build request headers based on the ArkElixir.Client.

  ## Examples

      iex> ArkElixir.build_headers(client)
      :world

  """
  @spec build_headers(ArkElixir.Client) :: response
  defp build_headers(client) do
    [
      "Content-Type": "application/json",
      nethash: "#{client.nethash}",
      version: "#{client.version}",
      port: 1
    ]
  end

  @doc """
  Builder an URL query based on the ArkElixir.Client.

  ## Examples

      iex> ArkElixir.build_query(client)
      :world

  """
  @spec build_query(Keyword.t()) :: response
  defp build_query(parameters) do
    queryString =
      parameters
      |> Enum.map(fn {key, value} -> "#{key}=#{value}" end)
      |> Enum.join("&")

    "?" <> queryString
  end
end
