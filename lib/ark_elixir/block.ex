defmodule ArkElixir.Block do
  @moduledoc """
  Documentation for ArkElixir.Block.
  """

  import ArkElixir

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Block.block
      :world

  """
  def block(client, id) do
    get(client, 'api/blocks/get', %{id: id})
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Block.blocks
      :world

  """
  def blocks(client, parameters \\ []) do
    get(client, 'api/blocks', parameters)
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Block.epoch
      :world

  """
  def epoch(client) do
    get(client, 'api/blocks/getEpoch')
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Block.height
      :world

  """
  def height(client) do
    get(client, 'api/blocks/getHeight')
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Block.nethash
      :world

  """
  def nethash(client) do
    get(client, 'api/blocks/getNethash')
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Block.fee
      :world

  """
  def fee(client) do
    get(client, 'api/blocks/getFee')
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Block.fees
      :world

  """
  def fees(client) do
    get(client, 'api/blocks/getFees')
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Block.milestone
      :world

  """
  def milestone(client) do
    get(client, 'api/blocks/getMilestone')
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Block.reward
      :world

  """
  def reward(client) do
    get(client, 'api/blocks/getReward')
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Block.supply
      :world

  """
  def supply(client) do
    get(client, 'api/blocks/getSupply')
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Block.status
      :world

  """
  def status(client) do
    get(client, 'api/blocks/getStatus')
  end
end
