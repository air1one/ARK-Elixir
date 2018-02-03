defmodule ArkElixir.Account do
  import ArkElixir

  def balance(client, address) do
    get(client, 'api/accounts/getBalance', %{address: address})
  end

  def publickey(client, address) do
    get(client, 'api/accounts/getPublickey', %{address: address})
  end

  def delegates(client, address) do
    get(client, 'api/accounts/delegates', %{address: address})
  end

  def fee(client) do
    get(client, 'api/accounts/delegates/fee')
  end

  def account(client, address) do
    get(client, 'api/accounts', %{address: address})
  end

  def top(client, parameters \\ []) do
    get(client, 'api/accounts/top', parameters)
  end
end
