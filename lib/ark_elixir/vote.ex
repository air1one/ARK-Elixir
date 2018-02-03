defmodule ArkElixir.Vote do
  @moduledoc """
  Documentation for ArkElixir.Vote.
  """

  import ArkElixir

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Vote.vote
      :world

  """
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
  Hello world.

  ## Examples

      iex> ArkElixir.Vote.unvote
      :world

  """
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
