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
  def balance(client, address) do
    get(client, 'api/accounts/getBalance', %{address: address})
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Account.publickey
      :world

  """
  def publickey(client, address) do
    get(client, 'api/accounts/getPublickey', %{address: address})
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Account.delegates
      :world

  """
  def delegates(client, address) do
    get(client, 'api/accounts/delegates', %{address: address})
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Account.fee
      :world

  """
  def fee(client) do
    get(client, 'api/accounts/delegates/fee')
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Account.account
      :world

  """
  def account(client, address) do
    get(client, 'api/accounts', %{address: address})
  end

  @doc """
  Hello world.

  ## Examples

      iex> ArkElixir.Account.top
      :world

  """
  def top(client, parameters \\ []) do
    get(client, 'api/accounts/top', parameters)
  end
end
