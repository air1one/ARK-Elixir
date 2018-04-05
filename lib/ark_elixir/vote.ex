defmodule ArkElixir.Vote do
  @moduledoc """
  Documentation for ArkElixir.Vote.
  """

  import ArkElixir

  alias ArkElixir.Util.TransactionBuilder

  @doc """
  Sign and create a new vote.

  ## Examples

      iex> ArkElixir.Vote.vote(client)
      :world

  """
  @spec vote(
    Tesla.Client.t(),
    String.t(),
    String.t(),
    String.t(),
    String.t()
  ) :: ArkElixir.response()
  def vote(client, network_address, secret, delegate, second_secret \\ nil) do
    delegate = ["+#{delegate}"]

    transaction =
      delegate
      |> TransactionBuilder.create_vote(secret, second_secret, network_address)
      |> TransactionBuilder.transaction_to_params

    post(client, "peer/transactions", %{transactions: [transaction]})
  end

  @doc """
  Sign and create a new unvote.

  ## Examples

      iex> ArkElixir.Vote.unvote(client)
      :world

  """
  @spec unvote(
    Tesla.Client.t(),
    String.t(),
    String.t(),
    String.t(),
    String.t()
  ) :: ArkElixir.response()
  def unvote(client, network_address, secret, delegate, second_secret \\ nil) do
    delegate = ["-#{delegate}"]

    transaction =
      delegate
      |> TransactionBuilder.create_vote(secret, second_secret, network_address)
      |> TransactionBuilder.transaction_to_params

    post(client, "peer/transactions", %{transactions: [transaction]})
  end
end
