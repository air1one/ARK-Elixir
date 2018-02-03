defmodule ArkElixir.Transaction do
  @moduledoc """
  Documentation for ArkElixir.Transaction.
  """

  import ArkElixir

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Transaction.transaction
      :world

  """
  def transaction(client, id) do
    get(client, 'api/transactions/get', %{id: id})
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Transaction.transactions
      :world

  """
  def transactions(client, parameters \\ []) do
    get(client, 'api/transactions', parameters)
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Transaction.unconfirmed_transaction
      :world

  """
  def unconfirmed_transaction(client, id) do
    get(client, 'api/transactions/unconfirmed/get', %{id: id})
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Transaction.unconfirmed_transactions
      :world

  """
  def unconfirmed_transactions(client, parameters \\ []) do
    get(client, 'api/transactions/unconfirmed', parameters)
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Transaction.create
      :world

  """
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
  Hello world.

  ## Examples

      iex> ArkElixir.Transaction.create_from_signed_object
      :world

  """
  def create_from_signed_object(client, transaction) do
    post(client, 'peer/transactions', %{transactions: [transaction]})
  end
end
