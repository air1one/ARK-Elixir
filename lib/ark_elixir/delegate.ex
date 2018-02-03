defmodule ArkElixir.Delegate do
  @moduledoc """
  Documentation for ArkElixir.Delegate.
  """

  import ArkElixir

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Delegate.count
      :world

  """
  def count(client) do
    get(client, 'api/delegates/count')
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Delegate.search
      :world

  """
  def search(client, q, parameters \\ []) do
    get(client, 'api/delegates/search', %{q: q})
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Delegate.voters
      :world

  """
  def voters(client, publicKey, parameters \\ []) do
    get(client, 'api/delegates/voters', %{publicKey: publicKey})
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Delegate.delegate
      :world

  """
  def delegate(client, parameters \\ []) do
    get(client, 'api/delegates/get', parameters)
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Delegate.delegates
      :world

  """
  def delegates(client, parameters \\ []) do
    get(client, 'api/delegates/', parameters)
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Delegate.fee
      :world

  """
  def fee(client) do
    get(client, 'api/delegates/fee')
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Delegate.forged_by_account
      :world

  """
  def forged_by_account(client, generatorPublicKey) do
    get(client, 'api/delegates/forging/getForgedByAccount', %{
      generatorPublicKey: generatorPublicKey
    })
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Delegate.create
      :world

  """
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

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Delegate.next_forgers
      :world

  """
  def next_forgers(client) do
    get(client, 'api/delegates/getNextForgers')
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Delegate.enable_forging
      :world

  """
  def enable_forging(client, secret, parameters \\ []) do
    post(client, 'api/delegates/forging/enable', %{secret: secret})
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Delegate.disable_forging
      :world

  """
  def disable_forging(client, secret, parameters \\ []) do
    post(client, 'api/delegates/forging/disable', %{secret: secret})
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Delegate.forging_status
      :world

  """
  def forging_status(client, publicKey, parameters \\ []) do
    get(client, 'api/delegates/forging/status', %{publicKey: publicKey})
  end
end
