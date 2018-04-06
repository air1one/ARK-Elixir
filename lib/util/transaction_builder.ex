defmodule ArkElixir.Util.TransactionBuilder do
  alias ArkElixir.Util.{Base58Check, EcKey}

  # 13:00:00 March 21, 2017
  @ark_epoch 1490101200

  @transfer 0
  @second_signature 1
  @delegate 2
  @vote 3
  @multisignature 4

  # @transfer_fee 10000000
  @second_signature_fee 500000000
  @delegate_fee 2500000000
  @vote_fee 100000000
  @multisignature_base_fee 500000000

  @doc """
  Unix timestamp representing the seconds between the Unix Epoch and the Ark
  Epoch. Add this to the timestamps received from the API to make them UNIX.
  """
  @spec ark_epoch() :: Integer.t()
  def ark_epoch do
    @ark_epoch
  end

  @spec create_delegate(String.t(), String.t(), String.t()) :: Map.t()
  def create_delegate(username, secret, second_secret \\ nil) do
    key = EcKey.get_private_key(secret)
    public_key = EcKey.private_key_to_public_key(key)

    transaction = %{
      amount: 0,
      asset: %{
        delegate: %{
          public_key: public_key,
          username: username
        }
      },
      fee: @delegate_fee,
      id: nil,
      sender_public_key: public_key,
      sign_signature: nil,
      signature: nil,
      timestamp: __MODULE__.seconds_since_epoch,
      type: @delegate,
    }

    add_signatures_and_create_id(transaction, secret, second_secret)
  end

  @spec create_multisignature(
    String.t(),
    String.t(),
    List.t(),
    Integer.t(),
    Integer.t()
  ) :: Map.t()
  def create_multisignature(secret, second_secret, keysgroup, lifetime, min) do
    key = EcKey.get_private_key(secret)

    transaction = %{
      :type => @multisignature,
      :fee => (1 + length(keysgroup)) * @multisignature_base_fee,
      :sender_public_key => EcKey.private_key_to_public_key(key),
      :asset => %{
        :multisignature => %{
          :min => min,
          :lifetime => lifetime,
          :keysgroup => keysgroup
        }
      },
      :amount => 0,
      :timestamp => __MODULE__.seconds_since_epoch,
      :signature => nil,
      :sign_signature => nil,
      :id => nil
    }

    add_signatures_and_create_id(transaction, secret, second_secret)
  end

  @spec create_second_signature(String.t(), String.t()) :: Map.t()
  def create_second_signature(second_secret, first_secret) do
    key = EcKey.get_private_key(first_secret)
    second_key = EcKey.get_private_key(second_secret)

    transaction = %{
      amount: 0,
      asset: %{
        signature: %{
          public_key: EcKey.private_key_to_public_key(second_key)
        }
      },
      fee: @second_signature_fee,
      id: nil,
      sender_public_key: EcKey.private_key_to_public_key(key),
      sign_signature: nil,
      signature: nil,
      timestamp: __MODULE__.seconds_since_epoch,
      type: @second_signature
    }

    add_signatures_and_create_id(transaction, first_secret)
  end

  @spec create_transfer(
    String.t(),
    Integer.t(),
    String.t(),
    String.t(),
    String.t()
  ) :: Map.t
  def create_transfer(
    recipient_id,
    amount,
    vendor_field,
    secret,
    second_secret \\ nil
  ) do
    key = ArkElixir.Util.EcKey.get_private_key(secret)

    transaction = %{
      amount: amount,
      fee: @transfer,
      id: nil,
      recipient_id: recipient_id,
      sender_public_key: EcKey.private_key_to_public_key(key),
      sign_signature: nil,
      signature: nil,
      timestamp: __MODULE__.seconds_since_epoch,
      type: @transfer,
      vendor_field: vendor_field
    }

    add_signatures_and_create_id(transaction, secret, second_secret)
  end

  @spec create_vote(Array.t(), String.t(), String.t(), String.t()) :: Map.t()
  def create_vote(votes, secret, second_secret, network_address \\ nil) do
    network_address = network_address || <<0x17>>
    key = EcKey.get_private_key(secret)

    transaction = %{
      amount: 0,
      asset: %{ votes: votes },
      fee: @vote_fee,
      id: nil,
      recipient_id: EcKey.private_key_to_address(key, network_address),
      sender_public_key: EcKey.private_key_to_public_key(key),
      sign_signature: nil,
      signature: nil,
      timestamp: __MODULE__.seconds_since_epoch,
      type: @vote
    }

    add_signatures_and_create_id(transaction, secret, second_secret)
  end

  @spec seconds_since_epoch() :: Integer.t()
  def seconds_since_epoch do
    :os.system_time(:seconds) - @ark_epoch
  end

  @spec transaction_to_params(Map.t()) :: Map.t()
  def transaction_to_params(transaction) do
    valid_param_keys = [:amount, :fee, :id, :signature, :timestamp, :type]

    sign_signature =
      if transaction[:sign_signature] do
        %{ :signSignature => transaction[:sign_signature] }
      else
        %{}
      end

    transformed = %{
      :recipientId => transaction[:recipient_id],
      :vendorField => transaction[:vendor_field],
      :senderPublicKey => transaction[:sender_public_key]
    }

    asset = get_asset(transaction)

    transaction
    |> Map.take(valid_param_keys)
    |> Map.merge(sign_signature)
    |> Map.merge(transformed)
    |> Map.merge(asset)
  end

  # private

  defp add_signatures_and_create_id(
    transaction,
    secret,
    second_secret \\ nil
  ) do
    signature =
      transaction
      |> get_bytes
      |> EcKey.sign(secret)

    transaction =
      transaction
      |> Map.put(:signature, signature)
      |> second_signing(second_secret)

    bytes = get_bytes(transaction, false, false)
    id = :sha256 |> :crypto.hash(bytes) |> Base.encode16 |> String.downcase

    Map.put(transaction, :id, id)
  end

  defp get_asset(%{asset: asset, type: type}) do
    case type do
      @delegate ->
        %{
          :asset => %{
            :delegate => %{
              :username => asset[:delegate][:username],
              :publicKey => asset[:delegate][:public_key]
            }
          }
        }

      @multisignature ->
        %{:asset => asset}

      @second_signature ->
        %{
          :asset => %{
            :signature => %{
              :publicKey => asset[:signature][:public_key]
            }
          }
        }

      @transfer ->
        %{}

      @vote ->
        %{:asset => asset}
    end
  end

  defp get_asset(%{type: type}) do
    get_asset(%{asset: nil, type: type})
  end

  defp get_asset_info(%{asset: asset, type: type}) do
    case type do
      @delegate ->
        asset
        |> Map.get(:delegate)
        |> Map.get(:username)

      @multisignature ->
        ms_asset = asset[:multisignature]
        keysgroup = Enum.join(ms_asset[:keysgroup], "")
        <<ms_asset[:min]>> <> <<ms_asset[:lifetime]>> <> keysgroup

      @second_signature ->
        asset
        |> Map.get(:signature)
        |> Map.get(:public_key)
        |> String.upcase
        |> Base.decode16!

      @transfer ->
        <<>>

      @vote ->
        asset
        |> Map.get(:votes)
        |> Enum.join("")
    end
  end

  defp get_asset_info(%{type: type}) do
    get_asset_info(%{asset: nil, type: type})
  end

  defp get_bytes(
    transaction,
    skip_signature \\ true,
    skip_second_signature \\ true
  ) do
    amount = <<transaction[:amount]::little-64>>
    asset_info = get_asset_info(transaction)
    fee = <<transaction[:fee]::little-64>>
    recipient_id = get_recipient_id(transaction)
    second_signature = get_second_signature(transaction, skip_second_signature)
    sender_public_key = get_sender_public_key(transaction)
    signature = get_signature(transaction, skip_signature)
    timestamp =  <<transaction[:timestamp]::little-32>>
    type = <<transaction[:type]>>
    vendor_field = get_vendor_field(transaction)

    type <>
    timestamp <>
    sender_public_key <>
    recipient_id <>
    vendor_field <>
    amount <>
    asset_info <>
    fee <>
    signature <>
    second_signature
  end

  defp get_recipient_id(%{recipient_id: recipient_id}) do
    Base58Check.decode58check(recipient_id)
  end

  defp get_recipient_id(_transaction) do
    String.duplicate(<<0>>, 21)
  end

  defp get_sender_public_key(%{sender_public_key: sender_public_key}) do
    sender_public_key |> String.upcase |> Base.decode16! |> elem(1)
  end

  defp get_second_signature(%{sign_signature: signature}, false) do
    signature |> String.upcase |> Base.decode16!
  end

  defp get_second_signature(_transaction, _true) do
    <<>>
  end

  defp get_signature(%{signature: signature}, false) do
    signature |> String.upcase |> Base.decode16!
  end

  defp get_signature(_transaction, _true) do
    <<>>
  end

  defp get_vendor_field(%{vendor_field: vf}) do
    vf_length = String.length(vf)

    if vf_length >= 64 do
      String.slice(vf, 0..63)
    else
      vf <> String.duplicate(<<0>>, 64 - vf_length)
    end
  end

  defp get_vendor_field(_) do
    String.duplicate(<<0>>, 64)
  end

  defp second_signing(transaction, nil) do
    transaction
  end

  defp second_signing(transaction, second_secret) do
    sign_signature =
      transaction
      |> get_bytes(false)
      |> EcKey.sign(second_secret)

    Map.put(transaction, :sign_signature, sign_signature)
  end
end
