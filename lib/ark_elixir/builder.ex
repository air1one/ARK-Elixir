defmodule ArkElixir.Builder do
  def delegate(client, parameters) do
    build(client, "delegate.createDelegate", parameters)
  end

  def multisignature(client, parameters) do
    build(client, "multisignature.createMultisignature", parameters)
  end

  def signature(client, parameters) do
    build(client, "signature.createSignature", parameters)
  end

  def transaction(client, parameters) do
    build(client, "transaction.createTransaction", parameters)
  end

  def vote(client, parameters) do
    build(client, "vote.createVote", parameters)
  end

  def unvote(client, parameters) do
    build(client, "vote.deleteVote", parameters)
  end

  defp build(client, template, parameters) do
    nethashes = %{
      "6e84d08bd299ed97c212c886c98a57e36545c8f5d645ca7eeae63a8bd62d8988" => 0x17,
      "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23" => 0x1E
    }

    parameters = Keyword.put(parameters, :network, nethashes["#{client.nethash}"])
    parameters = Keyword.put(parameters, :arkjs, nethashes["#{client.arkjs}"])

    script = EEx.eval_file("templates/#{template}.eex", parameters)

    {:ok, fd, file_path} = Temp.open("#{template}.js")
    IO.write(fd, script)
    File.close(fd)

    {output, exit_code} = System.cmd("node", [file_path])

    File.rm(file_path)

    Poison.decode!(output)
  end
end
