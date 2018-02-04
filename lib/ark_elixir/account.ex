defmodule ArkElixir.Account do
  @moduledoc """
  Documentation for ArkElixir.Account.
  """

  import ArkElixir

  @doc """
  Get the balance of an account.

  ## Examples

      iex> ArkElixir.Account.balance(client)
      :world

  """
  @spec balance(ArkElixir.Client, String.t()) :: ArkElixir.response()
  def balance(client, address) do
    get(client, 'api/accounts/getBalance', %{address: address})
  end

  @doc """
  Get the public key of an account.

  ## Examples

      iex> ArkElixir.Account.publickey(client)
      :world

  """
  @spec publickey(ArkElixir.Client, String.t()) :: ArkElixir.response()
  def publickey(client, address) do
    get(client, 'api/accounts/getPublickey', %{address: address})
  end

  @doc """
  Get the delegates of an account.

  ## Examples

      iex> ArkElixir.Account.delegates(client)
      :world

  """
  @spec delegates(ArkElixir.Client, String.t()) :: ArkElixir.response()
  def delegates(client, address) do
    get(client, 'api/accounts/delegates', %{address: address})
  end

  @doc """
  Get the delegate fee of an account.

  ## Examples

      iex> ArkElixir.Account.fee(client)
      :world

  """
  @spec fee(ArkElixir.Client) :: ArkElixir.response()
  def fee(client) do
    get(client, 'api/accounts/delegates/fee')
  end

  @doc """
  Get an account.

  ## Examples

      iex> ArkElixir.Account.account(client)
      :world

  """
  @spec account(ArkElixir.Client, String.t()) :: ArkElixir.response()
  def account(client, address) do
    get(client, 'api/accounts', %{address: address})
  end

  @doc """
  Get a list of top accounts.

  ## Examples

      iex> ArkElixir.Account.top(client)
      :world

  """
  @spec top(ArkElixir.Client, Keyword.t()) :: ArkElixir.response()
  def top(client, parameters \\ []) do
    get(client, 'api/accounts/top', parameters)
  end
end
