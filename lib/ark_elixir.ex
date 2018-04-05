defmodule ArkElixir do
  @moduledoc """
  Documentation for ArkElixir.
  """

  @type response :: {:ok, any} | {:error, any}

  @doc """
  Shortcut to `ArkElixir.Client.new/1`
  """
  @spec client(Keyword.t()) :: Tesla.Client.t()
  def client(opts) do
    ArkElixir.Client.new(opts)
  end

  @doc """
  Shortcut to `Tesla.get/4`
  """
  @spec get(Tesla.Client.t(), String.t(), Keyword.t()) :: response()
  def get(client, url, opts \\ []) do
    # TODO: parse response
    Tesla.get(client, url, opts)
  end

  @doc """
  Alias for `put/4`
  """
  @spec patch(Tesla.Client.t(), String.t(), any(), Keyword.t()) :: response()
  def patch(client, url, body, opts \\ []) do
    # TODO: parse response
    Tesla.put(client, url, body, opts)
  end

  @doc """
  Shortcut to `Tesla.post/4`
  """
  @spec post(Tesla.Client.t(), String.t(), any(), Keyword.t()) :: response()
  def post(client, url, body, opts \\ []) do
    # TODO: parse response
    Tesla.post(client, url, body, opts)
  end

  @doc """
  Shortcut to `Tesla.put/4`
  """
  @spec put(Tesla.Client.t(), String.t(), any(), Keyword.t()) :: response()
  def put(client, url, body, opts \\ []) do
    # TODO: parse response
    Tesla.put(client, url, body, opts)
  end
end
