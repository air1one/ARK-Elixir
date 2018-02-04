defmodule ArkElixir.Account do
  @moduledoc """
  Documentation for ArkElixir.Account.
  """

  import ArkElixir

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Account.balance
      :world

  """
  @spec balance(ArkElixir.Client, String.t()) :: ArkElixir.response()
  def balance(client, address) do
    get(client, 'api/accounts/getBalance', %{address: address})
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Account.publickey
      :world

  """
  @spec publickey(ArkElixir.Client, String.t()) :: ArkElixir.response()
  def publickey(client, address) do
    get(client, 'api/accounts/getPublickey', %{address: address})
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Account.delegates
      :world

  """
  @spec delegates(ArkElixir.Client, String.t()) :: ArkElixir.response()
  def delegates(client, address) do
    get(client, 'api/accounts/delegates', %{address: address})
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Account.fee
      :world

  """
  @spec fee(ArkElixir.Client) :: ArkElixir.response()
  def fee(client) do
    get(client, 'api/accounts/delegates/fee')
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Account.account
      :world

  """
  @spec account(ArkElixir.Client, String.t()) :: ArkElixir.response()
  def account(client, address) do
    get(client, 'api/accounts', %{address: address})
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Account.top
      :world

  """
  @spec top(ArkElixir.Client, Keyword.t()) :: ArkElixir.response()
  def top(client, parameters \\ []) do
    get(client, 'api/accounts/top', parameters)
  end
end
