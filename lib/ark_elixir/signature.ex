defmodule ArkElixir.Signature do
  @moduledoc """
  Documentation for ArkElixir.Signature.
  """

  import ArkElixir

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Signature.fee
      :world

  """
  @spec fee(ArkElixir.http(), ArkElixir.parameters()) :: ArkElixir.response()
  def fee(client) do
    get(client, 'api/signatures/fee')
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Signature.create
      :world

  """
  @spec create(ArkElixir.http(), ArkElixir.parameters()) :: ArkElixir.response()
  def create(client, secret, secondSecret) do
    parameters =
      ArkElixir.Builder.signature(
        client,
        secret: secret,
        secondSecret: secondSecret
      )

    post(client, 'peer/transactions', %{secret: secret})
  end
end
