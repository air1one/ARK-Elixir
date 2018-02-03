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
  @spec count(ArkElixir.http(), ArkElixir.parameters()) :: ArkElixir.response()
  def count(client) do
    get(client, 'api/delegates/count')
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Delegate.search
      :world

  """
  @spec search(ArkElixir.http(), ArkElixir.parameters()) :: ArkElixir.response()
  def search(client, q, parameters \\ []) do
    get(client, 'api/delegates/search', %{q: q})
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Delegate.voters
      :world

  """
  @spec voters(ArkElixir.http(), ArkElixir.parameters()) :: ArkElixir.response()
  def voters(client, publicKey, parameters \\ []) do
    get(client, 'api/delegates/voters', %{publicKey: publicKey})
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Delegate.delegate
      :world

  """
  @spec delegate(ArkElixir.http(), ArkElixir.parameters()) :: ArkElixir.response()
  def delegate(client, parameters \\ []) do
    get(client, 'api/delegates/get', parameters)
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Delegate.delegates
      :world

  """
  @spec delegates(ArkElixir.http(), ArkElixir.parameters()) :: ArkElixir.response()
  def delegates(client, parameters \\ []) do
    get(client, 'api/delegates/', parameters)
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Delegate.fee
      :world

  """
  @spec fee(ArkElixir.http(), ArkElixir.parameters()) :: ArkElixir.response()
  def fee(client) do
    get(client, 'api/delegates/fee')
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Delegate.forged_by_account
      :world

  """
  @spec forged_by_account(ArkElixir.http(), ArkElixir.parameters()) :: ArkElixir.response()
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
  @spec create(ArkElixir.http(), ArkElixir.parameters()) :: ArkElixir.response()
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
  @spec next_forgers(ArkElixir.http(), ArkElixir.parameters()) :: ArkElixir.response()
  def next_forgers(client) do
    get(client, 'api/delegates/getNextForgers')
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Delegate.enable_forging
      :world

  """
  @spec enable_forging(ArkElixir.http(), ArkElixir.parameters()) :: ArkElixir.response()
  def enable_forging(client, secret, parameters \\ []) do
    post(client, 'api/delegates/forging/enable', %{secret: secret})
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Delegate.disable_forging
      :world

  """
  @spec disable_forging(ArkElixir.http(), ArkElixir.parameters()) :: ArkElixir.response()
  def disable_forging(client, secret, parameters \\ []) do
    post(client, 'api/delegates/forging/disable', %{secret: secret})
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Delegate.forging_status
      :world

  """
  @spec forging_status(ArkElixir.http(), ArkElixir.parameters()) :: ArkElixir.response()
  def forging_status(client, publicKey, parameters \\ []) do
    get(client, 'api/delegates/forging/status', %{publicKey: publicKey})
  end
end
