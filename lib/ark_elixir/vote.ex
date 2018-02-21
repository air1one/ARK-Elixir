defmodule ArkElixir.Vote do
  @moduledoc """
  Documentation for ArkElixir.Vote.
  """

  import ArkElixir

  @doc """
  Sign and create a new vote.

  ## Examples

      iex> ArkElixir.Vote.vote(client)
      :world

  """
  @spec vote(ArkElixir.Client, String.t(), String.t(), String.t()) :: ArkElixir.response()
  def vote(client, secret, delegate, second_secret \\ nil) do
    transaction =
      ArkElixir.Util.TransactionBuilder.create_vote(
        ["+" <> delegate],
        secret,
        second_secret,
        <<0x1e>>
      ) |> ArkElixir.Util.TransactionBuilder.transaction_to_params

    post(client, 'peer/transactions', %{transactions: [transaction]})
  end

  @doc """
  Sign and create a new unvote.

  ## Examples

      iex> ArkElixir.Vote.unvote(client)
      :world

  """
  @spec unvote(ArkElixir.Client, String.t(), String.t(), String.t()) :: ArkElixir.response()
  def unvote(client, secret, delegate, second_secret \\ nil) do
    transaction =
      ArkElixir.Util.TransactionBuilder.create_vote(
        ["-" <> delegate],
        secret,
        second_secret,
        <<0x1e>>
      ) |> ArkElixir.Util.TransactionBuilder.transaction_to_params

    post(client, 'peer/transactions', %{transactions: [transaction]})
  end
end
