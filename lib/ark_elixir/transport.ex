defmodule ArkElixir.Transport do
  @moduledoc """
  Documentation for ArkElixir.Transport.
  """

  import ArkElixir

  @doc """
  Get a list of peers.

  ## Examples

      iex> ArkElixir.Transport.list(client)
      :world

  """
  @spec list(ArkElixir.Client) :: ArkElixir.response()
  def list(client) do
    get(client, 'peer/list')
  end

  @doc """
  Get a list of blocks by ids.

  ## Examples

      iex> ArkElixir.Transport.blocks_common(client)
      :world

  """
  @spec blocks_common(ArkElixir.Client, Keyword.t()) :: ArkElixir.response()
  def blocks_common(client, ids) do
    get(client, 'peer/blocks/common', %{ids: Poison.encode!(Enum.join(ids, ","))})
  end

  @doc """
  Get a single block.

  ## Examples

      iex> ArkElixir.Transport.block(client)
      :world

  """
  @spec block(ArkElixir.Client, String.t()) :: ArkElixir.response()
  def block(client, id) do
    get(client, 'peer/block', %{id: id})
  end

  @doc """
  Get all blocks.

  ## Examples

      iex> ArkElixir.Transport.blocks(client)
      :world

  """
  @spec blocks(ArkElixir.Client) :: ArkElixir.response()
  def blocks(client) do
    get(client, 'peer/blocks')
  end

  @doc """
  Get a list of transactions.

  ## Examples

      iex> ArkElixir.Transport.transactions(client)
      :world

  """
  @spec transactions(ArkElixir.Client) :: ArkElixir.response()
  def transactions(client) do
    get(client, 'peer/transactions')
  end

  @doc """
  Get a list of transactions by ids.

  ## Examples

      iex> ArkElixir.Transport.transactions_from_ids(client)
      :world

  """
  @spec transactions_from_ids(ArkElixir.Client, Keyword.t()) :: ArkElixir.response()
  def transactions_from_ids(client, ids) do
    get(client, 'peer/transactionsFromIds', %{ids: Enum.join(ids, ",")})
  end

  @doc """
  Create a new transaction.

  ## Examples

      iex> ArkElixir.Transport.create_transactions(client)
      :world

  """
  @spec create_transactions(ArkElixir.Client, Keyword.t()) :: ArkElixir.response()
  def create_transactions(client, transactions) do
    post(client, 'peer/transactions', %{transactions: [transactions]})
  end

  @doc """
  Get the blockchain height.

  ## Examples

      iex> ArkElixir.Transport.height(client)
      :world

  """
  @spec height(ArkElixir.Client) :: ArkElixir.response()
  def height(client) do
    get(client, 'peer/height')
  end

  @doc """
  Get the blockchain status.

  ## Examples

      iex> ArkElixir.Transport.status(client)
      :world

  """
  @spec status(ArkElixir.Client) :: ArkElixir.response()
  def status(client) do
    get(client, 'peer/status')
  end
end
