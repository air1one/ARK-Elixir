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
  @spec list(ArkElixir.http(), ArkElixir.parameters()) :: ArkElixir.response()
  def list(client) do
    get(client, 'peer/list')
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Transport.blocks_common
      :world

  """
  @spec blocks_common(ArkElixir.http(), ArkElixir.parameters()) :: ArkElixir.response()
  def blocks_common(client, ids) do
    get(client, 'peer/blocks/common', %{ids: ids})
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Transport.block
      :world

  """
  @spec block(ArkElixir.http(), ArkElixir.parameters()) :: ArkElixir.response()
  def block(client, id) do
    get(client, 'peer/block', %{id: id})
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Transport.blocks
      :world

  """
  @spec blocks(ArkElixir.http(), ArkElixir.parameters()) :: ArkElixir.response()
  def blocks(client) do
    get(client, 'peer/blocks')
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Transport.create_block
      :world

  """
  @spec create_block(ArkElixir.http(), ArkElixir.parameters()) :: ArkElixir.response()
  def create_block(client, block) do
    post(client, 'peer/blocks', %{block: block})
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Transport.transactions
      :world

  """
  @spec transactions(ArkElixir.http(), ArkElixir.parameters()) :: ArkElixir.response()
  def transactions(client) do
    get(client, 'peer/transactions')
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Transport.transactions_from_ids
      :world

  """
  @spec transactions_from_ids(ArkElixir.http(), ArkElixir.parameters()) :: ArkElixir.response()
  def transactions_from_ids(client, ids) do
    get(client, 'peer/transactionsFromIds', %{ids: ids})
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Transport.create_transactions
      :world

  """
  @spec create_transactions(ArkElixir.http(), ArkElixir.parameters()) :: ArkElixir.response()
  def create_transactions(client, transactions) do
    post(client, 'peer/transactions', %{transactions: [transactions]})
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Transport.height
      :world

  """
  @spec height(ArkElixir.http(), ArkElixir.parameters()) :: ArkElixir.response()
  def height(client) do
    get(client, 'peer/height')
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Transport.status
      :world

  """
  @spec status(ArkElixir.http(), ArkElixir.parameters()) :: ArkElixir.response()
  def status(client) do
    get(client, 'peer/status')
  end
end
