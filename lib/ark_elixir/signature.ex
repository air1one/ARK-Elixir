defmodule ArkElixir.Signature do
  import ArkElixir

  def fee(client) do
    get(client, 'api/signatures/fee')
  end

  def create(client, secret, secondSecret) do
    parameters =
      ArkElixir.Builder.signature(
        client,
        secret: secret,
        secondSecret: secondSecret
      )

    post(client, 'peer/transactions', %{secret: secret})
  end
end
