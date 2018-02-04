defmodule ArkElixir.Block do
  @moduledoc """
  Documentation for ArkElixir.Block.
  """

  import ArkElixir

  @doc """
  Get block by id.

  ## Examples

      iex> ArkElixir.Block.block(client)
      :world

  """
  @spec block(ArkElixir.Client, String.t()) :: ArkElixir.response()
  def block(client, id) do
    get(client, 'api/blocks/get', %{id: id})
  end

  @doc """
  Get all blocks.

  ## Examples

      iex> ArkElixir.Block.blocks(client)
      :world

  """
  @spec blocks(ArkElixir.Client, Keyword.t()) :: ArkElixir.response()
  def blocks(client, parameters \\ []) do
    get(client, 'api/blocks', parameters)
  end

  @doc """
  Get the blockchain epoch.

  ## Examples

      iex> ArkElixir.Block.epoch(client)
      :world

  """
  @spec epoch(ArkElixir.Client) :: ArkElixir.response()
  def epoch(client) do
    get(client, 'api/blocks/getEpoch')
  end

  @doc """
  Get the blockchain height.

  ## Examples

      iex> ArkElixir.Block.height(client)
      :world

  """
  @spec height(ArkElixir.Client) :: ArkElixir.response()
  def height(client) do
    get(client, 'api/blocks/getHeight')
  end

  @doc """
  Get the blockchain nethash.

  ## Examples

      iex> ArkElixir.Block.nethash(client)
      :world

  """
  @spec nethash(ArkElixir.Client) :: ArkElixir.response()
  def nethash(client) do
    get(client, 'api/blocks/getNethash')
  end

  @doc """
  Get the transaction fee for sending "normal" transactions.

  ## Examples

      iex> ArkElixir.Block.fee(client)
      :world

  """
  @spec fee(ArkElixir.Client) :: ArkElixir.response()
  def fee(client) do
    get(client, 'api/blocks/getFee')
  end

  @doc """
  Get the network fees.

  ## Examples

      iex> ArkElixir.Block.fees(client)
      :world

  """
  @spec fees(ArkElixir.Client) :: ArkElixir.response()
  def fees(client) do
    get(client, 'api/blocks/getFees')
  end

  @doc """
  Get the blockchain milestone.

  ## Examples

      iex> ArkElixir.Block.milestone(client)
      :world

  """
  @spec milestone(ArkElixir.Client) :: ArkElixir.response()
  def milestone(client) do
    get(client, 'api/blocks/getMilestone')
  end

  @doc """
  Get the blockchain reward.

  ## Examples

      iex> ArkElixir.Block.reward(client)
      :world

  """
  @spec reward(ArkElixir.Client) :: ArkElixir.response()
  def reward(client) do
    get(client, 'api/blocks/getReward')
  end

  @doc """
  Get the blockchain supply.

  ## Examples

      iex> ArkElixir.Block.supply(client)
      :world

  """
  @spec supply(ArkElixir.Client) :: ArkElixir.response()
  def supply(client) do
    get(client, 'api/blocks/getSupply')
  end

  @doc """
  Get the blockchain status.

  ## Examples

      iex> ArkElixir.Block.status(client)
      :world

  """
  @spec status(ArkElixir.Client) :: ArkElixir.response()
  def status(client) do
    get(client, 'api/blocks/getStatus')
  end
end
