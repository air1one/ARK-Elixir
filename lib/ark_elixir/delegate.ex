defmodule ArkElixir.Delegate do
  import ArkElixir

  def count(client) do
    get(client, 'api/delegates/count')
  end

  def search(client, q, parameters \\ []) do
    get(client, 'api/delegates/search', %{q: q})
  end

  def voters(client, publicKey, parameters \\ []) do
    get(client, 'api/delegates/voters', %{publicKey: publicKey})
  end

  def delegate(client, parameters \\ []) do
    get(client, 'api/delegates/get', parameters)
  end

  def delegates(client, parameters \\ []) do
    get(client, 'api/delegates/', parameters)
  end

  def fee(client) do
    get(client, 'api/delegates/fee')
  end

  def forged_by_account(client, generatorPublicKey) do
    get(client, 'api/delegates/forging/getForgedByAccount', %{
      generatorPublicKey: generatorPublicKey
    })
  end

  def create(client, secret, username, secondSecret \\ nil) do
    transaction =
      ArkElixir.Builder.delegate(
        client,
        username: username,
        secret: secret,
        secondSecret: secondSecret
      )

    post(client, 'peer/transactions', %{transactions: [transaction]})
  end

  def next_forgers(client) do
    get(client, 'api/delegates/getNextForgers')
  end

  def enable_forging(client, secret, parameters \\ []) do
    post(client, 'api/delegates/forging/enable', %{secret: secret})
  end

  def disable_forging(client, secret, parameters \\ []) do
    post(client, 'api/delegates/forging/disable', %{secret: secret})
  end

  def forging_status(client, publicKey, parameters \\ []) do
    get(client, 'api/delegates/forging/status', %{publicKey: publicKey})
  end
end
