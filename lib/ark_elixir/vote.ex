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
  def vote(client, secret, delegate, secondSecret \\ nil) do
    transaction =
      ArkElixir.Builder.unvote(
        client,
        secret: secret,
        delegate: delegate,
        secondSecret: secondSecret
      )

    post(client, 'peer/transactions', %{transactions: [transaction]})
  end

  @doc """
  Sign and create a new unvote.

  ## Examples

      iex> ArkElixir.Vote.unvote(client)
      :world

  """
  @spec unvote(ArkElixir.Client, String.t(), String.t(), String.t()) :: ArkElixir.response()
  def unvote(client, secret, delegate, secondSecret \\ nil) do
    transaction =
      ArkElixir.Builder.unvote(
        client,
        secret: secret,
        delegate: delegate,
        secondSecret: secondSecret
      )

    post(client, 'peer/transactions', %{transactions: [transaction]})
  end
end
