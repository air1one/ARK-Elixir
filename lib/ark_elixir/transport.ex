defmodule ArkElixir.Transport do
  @moduledoc """
  Documentation for ArkElixir.Transport.
  """

  import ArkElixir

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Transport.list
      :world

  """
  def list(client) do
    get(client, 'peer/list')
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Transport.blocks_common
      :world

  """
  def blocks_common(client, ids) do
    get(client, 'peer/blocks/common', %{ids: ids})
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Transport.block
      :world

  """
  def block(client, id) do
    get(client, 'peer/block', %{id: id})
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Transport.blocks
      :world

  """
  def blocks(client) do
    get(client, 'peer/blocks')
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Transport.create_block
      :world

  """
  def create_block(client, block) do
    post(client, 'peer/blocks', %{block: block})
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Transport.transactions
      :world

  """
  def transactions(client) do
    get(client, 'peer/transactions')
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Transport.transactions_from_ids
      :world

  """
  def transactions_from_ids(client, ids) do
    get(client, 'peer/transactionsFromIds', %{ids: ids})
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Transport.create_transactions
      :world

  """
  def create_transactions(client, transactions) do
    post(client, 'peer/transactions', %{transactions: [transactions]})
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Transport.height
      :world

  """
  def height(client) do
    get(client, 'peer/height')
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Transport.status
      :world

  """
  def status(client) do
    get(client, 'peer/status')
  end
end
