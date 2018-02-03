defmodule ArkElixir.Transaction do
  import ArkElixir

  def transaction(client, id) do
    get(client, 'api/transactions/get', %{id: id})
  end

  def transactions(client, parameters \\ []) do
    get(client, 'api/transactions', parameters)
  end

  def unconfirmed_transaction(client, id) do
    get(client, 'api/transactions/unconfirmed/get', %{id: id})
  end

  def unconfirmed_transactions(client, parameters \\ []) do
    get(client, 'api/transactions/unconfirmed', parameters)
  end

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

  def create_from_signed_object(client, transaction) do
    post(client, 'peer/transactions', %{transactions: [transaction]})
  end
end
