defmodule ArkElixir.MultiSignature do
  @moduledoc """
  Documentation for ArkElixir.MultiSignature.
  """

  import ArkElixir

  @doc """
  Get pending multi signature transactions.

  ## Examples

      iex> ArkElixir.MultiSignature.pending(client)
      :world

  """
  @spec pending(ArkElixir.Client, String.t()) :: ArkElixir.response()
  def pending(client, publicKey) do
    get(client, 'api/multisignatures/pending', %{publicKey: publicKey})
  end

  @doc """
  Sign a new multi signature.

  ## Examples

      iex> ArkElixir.MultiSignature.sign(client)
      :world

  """
  @spec sign(ArkElixir.Client, String.t(), String.t(), Keyword.t()) :: ArkElixir.response()
  def sign(client, transactionId, secret, parameters \\ []) do
    post(client, 'api/multisignatures/sign', %{transactionId: transactionId, secret: secret})
  end

  @doc """
  Create a new multi signature.

  ## Examples

      iex> ArkElixir.MultiSignature.create(client)
      :world

  """
  @spec create(ArkElixir.Client, String.t(), String.t(), List.t(), Integer.t(), Integer.t()) ::
          ArkElixir.response()
  def create(client, secret, second_secret, keysgroup, lifetime, min) do
    transaction =
      ArkElixir.Util.TransactionBuilder.create_multisignature(
        secret,
        second_secret,
        keysgroup,
        lifetime,
        min
      ) |> ArkElixir.Util.TransactionBuilder.transaction_to_params

    post(client, 'peer/transactions', %{transactions: [transaction]})
  end

  @doc """
  Get a list of accounts.

  ## Examples

      iex> ArkElixir.MultiSignature.accounts(client)
      :world

  """
  @spec accounts(ArkElixir.Client, String.t()) :: ArkElixir.response()
  def accounts(client, publicKey) do
    get(client, 'api/multisignatures/accounts', %{publicKey: publicKey})
  end

end
