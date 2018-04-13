defmodule ArkElixir.MultiSignature do
  @moduledoc """
  Documentation for ArkElixir.MultiSignature.
  """

  import ArkElixir

  @doc """
  Get a list of accounts.

  This works in theory but seems to lag too badly to be of use.
  """
  @spec accounts(Tesla.Client.t(), String.t()) :: ArkElixir.response()
  def accounts(client, public_key) do
    get(client, "api/multisignatures/accounts", query: [publicKey: public_key])
  end

  @doc """
  Create a new multi signature.

  DEPRECATED
  """
  @spec create(
    Tesla.Client.t(),
    String.t(),
    String.t(),
    List.t(),
    Integer.t(),
    Integer.t()
  ) :: ArkElixir.response()
  def create(_client, _secret, _second_secret, _keysgroup, _lifetime, _min) do
    "POST api/multisignatures has been deprecated."
  end

  @doc """
  Get pending multi signature transactions.

  ## Examples

      iex> ArkElixir.MultiSignature.pending(client, "02d21954fb256662f82560cdced947af040e5190d9a08e65ee29443090499b22ec")
      {:ok, %{"success" => true, "transactions" => []}}
  """
  @spec pending(Tesla.Client.t(), String.t()) :: ArkElixir.response()
  def pending(client, public_key) do
    get(client, "api/multisignatures/pending", query: [publicKey: public_key])
  end

  @doc """
  Sign a new multi signature.

  DEPRECATED
  """
  @spec sign(
    Tesla.Client.t(),
    String.t(),
    String.t(),
    Keyword.t()
  ) :: ArkElixir.response()
  def sign(_client, _transaction_id, _secret, _parameters \\ []) do
    raise "POST api/multisignatures/sign has been deprecated."
  end
end
