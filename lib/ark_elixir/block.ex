defmodule ArkElixir.Block do
  import ArkElixir

  def block(client, id) do
    get(client, 'api/blocks/get', %{id: id})
  end

  def blocks(client, parameters \\ []) do
    get(client, 'api/blocks', parameters)
  end

  def epoch(client) do
    get(client, 'api/blocks/getEpoch')
  end

  def height(client) do
    get(client, 'api/blocks/getHeight')
  end

  def nethash(client) do
    get(client, 'api/blocks/getNethash')
  end

  def fee(client) do
    get(client, 'api/blocks/getFee')
  end

  def fees(client) do
    get(client, 'api/blocks/getFees')
  end

  def milestone(client) do
    get(client, 'api/blocks/getMilestone')
  end

  def reward(client) do
    get(client, 'api/blocks/getReward')
  end

  def supply(client) do
    get(client, 'api/blocks/getSupply')
  end

  def status(client) do
    get(client, 'api/blocks/getStatus')
  end
end
