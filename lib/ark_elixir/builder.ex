defmodule ArkElixir.Builder do
  @moduledoc """
  Documentation for ArkElixir.Builder.
  """

  @doc """
  Create a new signed delegate transaction.

  ## Examples

      iex> ArkElixir.Builder.delegate(client)
      :world

  """
  @spec delegate(ArkElixir.Client, Keyword.t()) :: ArkElixir.response()
  def delegate(client, parameters) do
    build(client, "delegate.createDelegate", parameters)
  end

  @doc """
  Create a new signed multisignature transaction.

  ## Examples

      iex> ArkElixir.Builder.multisignature(client)
      :world

  """
  @spec multisignature(ArkElixir.Client, Keyword.t()) :: ArkElixir.response()
  def multisignature(client, parameters) do
    build(client, "multisignature.createMultisignature", parameters)
  end

  @doc """
  Create a new signed signature transaction.

  ## Examples

      iex> ArkElixir.Builder.signature(client)
      :world

  """
  @spec signature(ArkElixir.Client, Keyword.t()) :: ArkElixir.response()
  def signature(client, parameters) do
    build(client, "signature.createSignature", parameters)
  end

  @doc """
  Create a new signed transaction (send ARK).

  ## Examples

      iex> ArkElixir.Builder.transaction(client)
      :world

  """
  @spec transaction(ArkElixir.Client, Keyword.t()) :: ArkElixir.response()
  def transaction(client, parameters) do
    build(client, "transaction.createTransaction", parameters)
  end

  @doc """
  Create a new signed vote transaction.

  ## Examples

      iex> ArkElixir.Builder.vote(client)
      :world

  """
  @spec vote(ArkElixir.Client, Keyword.t()) :: ArkElixir.response()
  def vote(client, parameters) do
    build(client, "vote.createVote", parameters)
  end

  @doc """
  Create a new signed unvote transaction.

  ## Examples

      iex> ArkElixir.Builder.unvote(client)
      :world

  """
  @spec unvote(ArkElixir.Client, Keyword.t()) :: ArkElixir.response()
  def unvote(client, parameters) do
    build(client, "vote.deleteVote", parameters)
  end

  @doc """
  Create a new signed transaction.

  ## Examples

      iex> ArkElixir.Builder.build(client)
      :world

  """
  @spec unvote(ArkElixir.Client, Keyword.t()) :: ArkElixir.response()
  defp build(client, template, parameters) do
    nethashes = %{
      "6e84d08bd299ed97c212c886c98a57e36545c8f5d645ca7eeae63a8bd62d8988" => 0x17,
      "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23" => 0x1E
    }

    parameters = Keyword.put(parameters, :network, nethashes["#{client.nethash}"])
    parameters = Keyword.put(parameters, :arkjs, "#{client.arkjs}")

    script = EEx.eval_file("templates/#{template}.eex", parameters)

    {:ok, fd, file_path} = Temp.open("#{template}.js")
    IO.write(fd, script)
    File.close(fd)

    {output, exit_code} = System.cmd("node", [file_path])

    File.rm(file_path)

    Poison.decode!(output)
  end
end
