defmodule ArkElixir.Util.EcKey do

  alias Exbtc.Core, as: BtcCore

  def sign(message, secret) do
    private_key = get_private_key(secret)
    {_v, r, s} = BtcCore.ecdsa_raw_sign(
      Base.encode16(:crypto.hash(:sha256, message), case: :lower),
      private_key
    )

    encode_sequence(encode_integer(r), encode_integer(s))
      |> Base.encode16(case: :lower)
  end

  def get_private_key(secret) do
    Base.encode16(:crypto.hash(:sha256, secret), case: :lower)
  end

  def private_key_to_public_key(private_key) do
    BtcCore.compress(BtcCore.privkey_to_pubkey(private_key))
  end

  def private_key_to_address(private_key, network_address \\ 0x17) do
    private_key |> private_key_to_public_key |> public_key_to_address(network_address)
  end

  def secret_to_public_key(secret) do
    secret
      |> get_private_key
      |> private_key_to_public_key
  end

  def secret_to_address(secret, network_address \\ 0x17) do
    secret
      |> get_private_key
      |> private_key_to_address(network_address)
  end

  defp encode_sequence(r_encoded, s_encoded) do
    combined = r_encoded <> s_encoded
    <<0x30>> <> <<byte_length(combined)>> <> combined
  end

  defp encode_integer(integer) do
    h = integer |> Integer.to_string(16)
    s = case Integer.mod(String.length(h), 2) do
      0 -> elem(Base.decode16(h), 1)
      1 -> elem(Base.decode16("0" <> h), 1)
    end

    <<num, _ ::binary>> = s
    if num <= 0x7f do
      <<2, byte_length(s)>> <> s
    else
      <<2, byte_length(s) + 1, 0>> <> s
    end
  end

  defp byte_length(string) do
    div(bit_size(string), 8)
  end

  defp public_key_to_address(public_key, network_address \\ <<0x1e>>) do
    ripemd_public_key = :crypto.hash(:ripemd160, elem(Base.decode16(public_key, case: :lower), 1))
    ArkElixir.Util.Base58Check.encode58check(network_address, ripemd_public_key)
  end
end
