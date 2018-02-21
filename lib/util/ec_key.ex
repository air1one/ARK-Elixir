defmodule ArkElixir.Util.EcKey do

  alias Exbtc.Core, as: BtcCore
  require ArkElixir.Util.Der

  def sign(message, secret) do
    private_key = get_private_key(secret)
    {_v, r, s} = BtcCore.ecdsa_raw_sign(
      Base.encode16(:crypto.hash(:sha256, message), case: :lower),
      private_key
    )

    ArkElixir.Util.Der.encode_sequence(r, s)
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
  
  defp public_key_to_address(public_key, network_address \\ <<0x17>>) do
    ripemd_public_key = :crypto.hash(:ripemd160, elem(Base.decode16(public_key, case: :lower), 1))
    ArkElixir.Util.Base58Check.encode58check(network_address, ripemd_public_key)
  end
end
