defmodule ArkElixir.MultiSignature do
  import ArkElixir

  def pending(client, publicKey) do
    get(client, 'api/multisignatures/pending', %{publicKey: publicKey})
  end

  def sign(client, transactionId, secret, parameters \\ []) do
    post(client, 'api/multisignatures/sign', %{transactionId: transactionId, secret: secret})
  end

  def create(client, secret, secondSecret, keysgroup, lifetime, min) do
    parameters =
      ArkElixir.Builder.multisignature(
        client,
        secret: secret,
        secondSecret: secondSecret,
        keysgroup: keysgroup,
        lifetime: lifetime,
        min: min
      )

    post(client, 'peer/transactions', %{secret: secret})
  end
end
