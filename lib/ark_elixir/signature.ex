defmodule ArkElixir.Signature do
  @moduledoc """
  Documentation for ArkElixir.Signature.
  """

  import ArkElixir

  @doc """
  Get the fee for a signature.

  ## Examples

      iex> ArkElixir.Signature.fee(client)
      :world

  """
  @spec fee(ArkElixir.Client) :: ArkElixir.response()
  def fee(client) do
    get(client, 'api/signatures/fee')
  end

  @doc """
  Create a new signature.

  ## Examples

      iex> ArkElixir.Signature.create(client)
      :world

  """
  @spec create(ArkElixir.Client, String.t(), String.t()) :: ArkElixir.response()
  def create(client, secret, second_secret) do
    transaction =
      ArkElixir.Util.TransactionBuilder.create_second_signature(
        second_secret,
        secret
      ) |> ArkElixir.Util.TransactionBuilder.transaction_to_params

    post(client, 'peer/transactions', %{transactions: [transaction]})
  end
end
