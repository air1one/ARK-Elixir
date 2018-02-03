defmodule ArkElixir do
  use HTTPoison.Base
  alias ArkElixir.Client

  def get(client, path, params) do
    response =
      HTTPoison.get!(
        build_url(client, path) <> build_query(params),
        build_headers(client)
      )

    Poison.decode!(response.body)
  end

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

  defp build_url(client, path) do
    "#{client.protocol}://#{client.ip}:#{client.port}/#{path}"
  end

  defp build_headers(client) do
    [
      "Content-Type": "application/json",
      nethash: "#{client.nethash}",
      version: "#{client.version}",
      port: 1
    ]
  end

  defp build_query(params) do
    queryString =
      params
      |> Enum.map(fn {key, value} -> "#{key}=#{value}" end)
      |> Enum.join("&")

    "?" <> queryString
  end
end
