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
  def pending(client, publicKey) do
    get(client, 'api/multisignatures/pending', %{publicKey: publicKey})
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.MultiSignature.sign
      :world

  """
  def sign(client, transactionId, secret, parameters \\ []) do
    post(client, 'api/multisignatures/sign', %{transactionId: transactionId, secret: secret})
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.MultiSignature.create
      :world

  """
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
