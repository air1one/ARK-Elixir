defmodule ArkElixir do
  @moduledoc """
  Documentation for ArkElixir.
  """

  use HTTPoison.Base
  alias ArkElixir.Client

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.get
      :world

  """
  def get(client, path, params) do
    response =
      HTTPoison.get!(
        build_url(client, path) <> build_query(params),
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
  def post(client, path, params) do
    payload = Poison.encode!(params)

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
  def put(client, path, params) do
    payload = Poison.encode!(params)

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
  defp build_url(client, path) do
    "#{client.protocol}://#{client.ip}:#{client.port}/#{path}"
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.build_headers
      :world

  """
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
  defp build_query(params) do
    queryString =
      params
      |> Enum.map(fn {key, value} -> "#{key}=#{value}" end)
      |> Enum.join("&")

    "?" <> queryString
  end
end
