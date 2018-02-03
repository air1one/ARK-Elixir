defmodule ArkElixir.Transport do
  import ArkElixir

  def list(client) do
    get(client, 'peer/list')
  end

  def blocks_common(client, ids) do
    get(client, 'peer/blocks/common', %{ids: ids})
  end

  def block(client, id) do
    get(client, 'peer/block', %{id: id})
  end

  def blocks(client) do
    get(client, 'peer/blocks')
  end

  def create_block(client, block) do
    post(client, 'peer/blocks', %{block: block})
  end

  def transactions(client) do
    get(client, 'peer/transactions')
  end

  def transactions_from_ids(client, ids) do
    get(client, 'peer/transactionsFromIds', %{ids: ids})
  end

  def create_transactions(client, transactions) do
    post(client, 'peer/transactions', %{transactions: [transactions]})
  end

  def height(client) do
    get(client, 'peer/height')
  end

  def status(client) do
    get(client, 'peer/status')
  end
end
