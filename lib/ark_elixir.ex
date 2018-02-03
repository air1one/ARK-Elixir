defmodule ArkElixir do
  @moduledoc """
  Documentation for ArkElixir.
  """

  use HTTPoison.Base
  alias ArkElixir.Client

  @type http :: ArkElixir.Client
  @type parameters :: Keyword.t()
  @type path :: String.t()
  @type response :: %{String.t() => any}

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.get
      :world

  """
  @spec get(path, parameters) :: response
  def get(client, path, parameters) do
    response =
      HTTPoison.get!(
        build_url(client, path) <> build_query(parameters),
        build_headers(client)
      )

    Poison.decode!(response.body)
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.post
      :world

  """
  @spec post(path, parameters) :: response
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
  Hello world.

  ## Examples

      iex> ArkElixir.put
      :world

  """
  @spec put(path, parameters) :: response
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
  Hello world.

  ## Examples

      iex> ArkElixir.build_url
      :world

  """
  @spec build_url(path, parameters) :: response
  defp build_url(client, path) do
    "#{client.protocol}://#{client.ip}:#{client.port}/#{path}"
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.build_headers
      :world

  """
  @spec build_headers(path, parameters) :: response
  defp build_headers(client) do
    [
      "Content-Type": "application/json",
      nethash: "#{client.nethash}",
      version: "#{client.version}",
      port: 1
    ]
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.build_query
      :world

  """
  @spec build_query(path, parameters) :: response
  defp build_query(parameters) do
    queryString =
      parameters
      |> Enum.map(fn {key, value} -> "#{key}=#{value}" end)
      |> Enum.join("&")

    "?" <> queryString
  end
end
