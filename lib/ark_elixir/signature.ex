defmodule ArkElixir.Signature do
  @moduledoc """
  Documentation for ArkElixir.Signature.
  """

  import ArkElixir

  @doc """
  Create a new signature.

  DEPRECATED
  """
  @spec create(Tesla.Client.t(), String.t(), String.t()) :: ArkElixir.response()
  def create(_client, _secret, _second_secret) do
    raise "POST /api/signatures is deprecated."
  end

  @doc """
  Get the fee for a signature.

  ## Examples

      iex> ArkElixir.Signature.fee(client)
      {:ok, 500000000}
  """
  @spec fee(Tesla.Client.t()) :: ArkElixir.response()
  def fee(client) do
    client
    |> get("api/signatures/fee")
    |> case do
      {:ok, %{"fee" => fee, "success" => true}} -> {:ok, fee}
      {:ok, invalid_response} -> {:error, invalid_response}
      {:error, _message} = error -> error
    end
  end
end
