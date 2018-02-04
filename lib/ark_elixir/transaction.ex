defmodule ArkElixir.Transaction do
  @moduledoc """
  Documentation for ArkElixir.Transaction.
  """

  import ArkElixir

  @doc """
  Get a single transaction.

  ## Examples

      iex> ArkElixir.Transaction.transaction
      :world

  """
  @spec transaction(ArkElixir.Client, Keyword.t()) :: ArkElixir.response()
  def transaction(client, id) do
    get(client, 'api/transactions/get', %{id: id})
  end

  @doc """
  Get all transactions.

  ## Examples

      iex> ArkElixir.Transaction.transactions
      :world

  """
  @spec transactions(ArkElixir.Client, Keyword.t()) :: ArkElixir.response()
  def transactions(client, parameters \\ []) do
    get(client, 'api/transactions', parameters)
  end

  @doc """
  Get a single unconfirmed transaction.

  ## Examples

      iex> ArkElixir.Transaction.unconfirmed_transaction
      :world

  """
  @spec unconfirmed_transaction(ArkElixir.Client, String.t()) :: ArkElixir.response()
  def unconfirmed_transaction(client, id) do
    get(client, 'api/transactions/unconfirmed/get', %{id: id})
  end

  @doc """
  Get all unconfirmed transactions.

  ## Examples

      iex> ArkElixir.Transaction.unconfirmed_transactions
      :world

  """
  @spec unconfirmed_transactions(ArkElixir.Client, Keyword.t()) :: ArkElixir.response()
  def unconfirmed_transactions(client, parameters \\ []) do
    get(client, 'api/transactions/unconfirmed', parameters)
  end

  @doc """
  Sign and create a new transaction.

  ## Examples

      iex> ArkElixir.Transaction.create
      :world

  """
  @spec create(ArkElixir.Client, String.t(), String.t(), String.t(), String.t(), String.t()) ::
          ArkElixir.response()
  def create(client, recipientId, amount, vendorField, secret, secondSecret \\ nil) do
    transaction =
      ArkElixir.Builder.transaction(
        client,
        recipientId: recipientId,
        amount: amount,
        vendorField: vendorField,
        secret: secret,
        secondSecret: secondSecret
      )

    post(client, 'peer/transactions', %{transactions: [transaction]})
  end

  @doc """
  Create a new transaction.

  ## Examples

      iex> ArkElixir.Transaction.create_from_signed_object
      :world

  """
  @spec create_from_signed_object(ArkElixir.Client, Keyword.t()) :: ArkElixir.response()
  def create_from_signed_object(client, transaction) do
    post(client, 'peer/transactions', %{transactions: [transaction]})
  end
end
