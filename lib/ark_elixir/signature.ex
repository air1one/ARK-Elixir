defmodule ArkElixir.Signature do
  @moduledoc """
  Documentation for ArkElixir.Signature.
  """

  import ArkElixir

  alias ArkElixir.Util.TransactionBuilder

  @doc """
  Create a new signature.

  ## Examples

      iex> ArkElixir.Signature.create(client)
      :world

  """
  @spec create(Tesla.Client.t(), String.t(), String.t()) :: ArkElixir.response()
  def create(client, secret, second_secret) do
    transaction =
      second_secret
      |> TransactionBuilder.create_second_signature(secret)
      |> TransactionBuilder.transaction_to_params

    post(client, "peer/transactions", %{transactions: [transaction]})
  end

  @doc """
  Get the fee for a signature.

  ## Examples

      iex> ArkElixir.Signature.fee(client)
      :world

  """
  @spec fee(Tesla.Client.t()) :: ArkElixir.response()
  def fee(client) do
    get(client, "api/signatures/fee")
  end
end
