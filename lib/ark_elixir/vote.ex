defmodule ArkElixir.Vote do
  import ArkElixir

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
