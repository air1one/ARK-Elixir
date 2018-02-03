defmodule ArkElixir.MultiSignature do
  @moduledoc """
  Documentation for ArkElixir.MultiSignature.
  """

  import ArkElixir

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.MultiSignature.pending
      :world

  """
  @spec pending(ArkElixir.http(), ArkElixir.parameters()) :: ArkElixir.response()
  def pending(client, publicKey) do
    get(client, 'api/multisignatures/pending', %{publicKey: publicKey})
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.MultiSignature.sign
      :world

  """
  @spec sign(ArkElixir.http(), ArkElixir.parameters()) :: ArkElixir.response()
  def sign(client, transactionId, secret, parameters \\ []) do
    post(client, 'api/multisignatures/sign', %{transactionId: transactionId, secret: secret})
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.MultiSignature.create
      :world

  """
  @spec create(ArkElixir.http(), ArkElixir.parameters()) :: ArkElixir.response()
  def create(client, secret, secondSecret, keysgroup, lifetime, min) do
    parameters =
      ArkElixir.Builder.multisignature(
        client,
        secret: secret,
        secondSecret: secondSecret,
        keysgroup: keysgroup,
        lifetime: lifetime,
        min: min
      )

    post(client, 'peer/transactions', %{secret: secret})
  end
end
