defmodule ArkElixir.Delegate do
  @moduledoc """
  Documentation for ArkElixir.Delegate.
  """

  import ArkElixir

  @doc """
  Get the count of delegates

  ## Examples

      iex> ArkElixir.Delegate.count(client)
      :world

  """
  @spec count(ArkElixir.Client) :: ArkElixir.response()
  def count(client) do
    get(client, 'api/delegates/count')
  end

  @doc """
  Search for specific delegates

  ## Examples

      iex> ArkElixir.Delegate.search(client)
      :world

  """
  @spec search(ArkElixir.Client, String.t(), Keyword.t()) :: ArkElixir.response()
  def search(client, query, parameters \\ []) do
    get(client, 'api/delegates/search', %{q: query})
  end

  @doc """
  Get a list of voters for a delegate

  ## Examples

      iex> ArkElixir.Delegate.voters(client)
      :world

  """
  @spec voters(ArkElixir.Client, String.t(), Keyword.t()) :: ArkElixir.response()
  def voters(client, publicKey, parameters \\ []) do
    get(client, 'api/delegates/voters', %{publicKey: publicKey})
  end

  @doc """
  Get a single delegate

  ## Examples

      iex> ArkElixir.Delegate.delegate(client)
      :world

  """
  @spec delegate(ArkElixir.Client, Keyword.t()) :: ArkElixir.response()
  def delegate(client, parameters \\ []) do
    get(client, 'api/delegates/get', parameters)
  end

  @doc """
  Get all delegates

  ## Examples

      iex> ArkElixir.Delegate.delegates(client)
      :world

  """
  @spec delegates(ArkElixir.Client, Keyword.t()) :: ArkElixir.response()
  def delegates(client, parameters \\ []) do
    get(client, 'api/delegates/', parameters)
  end

  @doc """
  Create a new delegate

  ## Examples

      iex> ArkElixir.Delegate.fee(client)
      :world

  """
  @spec fee(ArkElixir.Client) :: ArkElixir.response()
  def fee(client) do
    get(client, 'api/delegates/fee')
  end

  @doc """
  Get the delegate fee

  ## Examples

      iex> ArkElixir.Delegate.forged_by_account(client)
      :world

  """
  @spec forged_by_account(ArkElixir.Client, String.t()) :: ArkElixir.response()
  def forged_by_account(client, generatorPublicKey) do
    get(client, 'api/delegates/forging/getForgedByAccount', %{
      generatorPublicKey: generatorPublicKey
    })
  end

  @doc """
  Get the amount of ARKs forged by an account

  ## Examples

      iex> ArkElixir.Delegate.create(client)
      :world

  """
  @spec create(ArkElixir.Client, String.t(), String.t(), String.t()) :: ArkElixir.response()
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
  Get the next forger

  ## Examples

      iex> ArkElixir.Delegate.next_forgers(client)
      :world

  """
  @spec next_forgers(ArkElixir.Client) :: ArkElixir.response()
  def next_forgers(client) do
    get(client, 'api/delegates/getNextForgers')
  end

  @doc """
  Enable forging for a delegate

  ## Examples

      iex> ArkElixir.Delegate.enable_forging(client)
      :world

  """
  @spec enable_forging(ArkElixir.Client, String.t(), Keyword.t()) :: ArkElixir.response()
  def enable_forging(client, secret, parameters \\ []) do
    post(client, 'api/delegates/forging/enable', %{secret: secret})
  end

  @doc """
  Disable forging for a delegate

  ## Examples

      iex> ArkElixir.Delegate.disable_forging(client)
      :world

  """
  @spec disable_forging(ArkElixir.Client, String.t(), Keyword.t()) :: ArkElixir.response()
  def disable_forging(client, secret, parameters \\ []) do
    post(client, 'api/delegates/forging/disable', %{secret: secret})
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Delegate.forging_status(client)
      :world

  """
  @spec forging_status(ArkElixir.Client, String.t(), Keyword.t()) :: ArkElixir.response()
  def forging_status(client, publicKey, parameters \\ []) do
    get(client, 'api/delegates/forging/status', %{publicKey: publicKey})
  end
end
