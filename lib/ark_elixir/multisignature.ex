defmodule ArkElixir.MultiSignature do
  @moduledoc """
  Documentation for ArkElixir.MultiSignature.
  """

  import ArkElixir

  @doc """
  Get pending multi signature transactions.

  ## Examples

      iex> ArkElixir.MultiSignature.pending
      :world

  """
  @spec pending(ArkElixir.Client, String.t()) :: ArkElixir.response()
  def pending(client, publicKey) do
    get(client, 'api/multisignatures/pending', %{publicKey: publicKey})
  end

  @doc """
  Sign a new multi signature.

  ## Examples

      iex> ArkElixir.MultiSignature.sign
      :world

  """
  @spec sign(ArkElixir.Client, String.t(), String.t(), Keyword.t()) :: ArkElixir.response()
  def sign(client, transactionId, secret, parameters \\ []) do
    post(client, 'api/multisignatures/sign', %{transactionId: transactionId, secret: secret})
  end

  @doc """
  Create a new multi signature.

  ## Examples

      iex> ArkElixir.MultiSignature.create
      :world

  """
  @spec create(ArkElixir.Client, String.t(), String.t(), String.t(), Integer.t(), Integer.t()) ::
          ArkElixir.response()
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

  @doc """
  Get a list of accounts.

  ## Examples

      iex> ArkElixir.MultiSignature.accounts
      :world

  """
  @spec accounts(ArkElixir.Client, String.t()) :: ArkElixir.response()
  def accounts(client, publicKey) do
    get(client, 'api/multisignatures/accounts', %{publicKey: publicKey})
  end

end
