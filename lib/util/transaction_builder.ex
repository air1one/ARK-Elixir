defmodule ArkElixir.Util.TransactionBuilder do
  require ArkElixir.Util.Base58Check

  # 13:00:00 March 21, 2017
  @ark_epoch 1490101200

  defmodule TransactionType do
    @transfer 0
    @second_signature 1
    @delegate 2
    @vote 3
    @multisignature 4

    def transfer, do: @transfer
    def second_signature, do: @second_signature
    def delegate, do: @delegate
    def vote, do: @vote
    def multisignature, do: @multisignature
  end

  defmodule TransactionFee do
    @transfer 10000000
    @second_signature 500000000
    @delegate 2500000000
    @vote 100000000
    @multisignature_base 500000000

    def transfer, do: @transfer
    def second_signature, do: @second_signature
    def delegate, do: @delegate
    def vote, do: @vote
    def multisignature_base, do: @multisignature_base
  end

  def ark_epoch, do: @ark_epoch

  @spec create_transfer(String.t(), Integer.t(), String.t(), String.t(), String.t()) :: Map
  def create_transfer(recipient_id, amount, vendor_field, secret, second_secret \\ nil) do
    key = ArkElixir.Util.EcKey.get_private_key(secret)

    transaction = %{
      :type => TransactionType.transfer,
      :fee => TransactionFee.transfer,
      :sender_public_key => ArkElixir.Util.EcKey.private_key_to_public_key(key),
      :recipient_id => recipient_id,
      :amount => amount,
      :vendor_field => vendor_field,
      :timestamp => __MODULE__.seconds_since_epoch,
      :signature => nil,
      :sign_signature => nil,
      :id => nil
    }

    add_signatures_and_create_id(transaction, secret, second_secret)
  end

  @spec create_vote(Array.t(), String.t(), String.t(), String.t()) :: Map
  def create_vote(votes, secret, second_secret, network_address \\ nil) do
    network_address = network_address || <<0x17>>
    key = ArkElixir.Util.EcKey.get_private_key(secret)

    transaction = %{
      :type => TransactionType.vote,
      :fee => TransactionFee.vote,
      :sender_public_key => ArkElixir.Util.EcKey.private_key_to_public_key(key),
      :recipient_id => ArkElixir.Util.EcKey.private_key_to_address(key, network_address),
      :amount => 0,
      :timestamp => __MODULE__.seconds_since_epoch,
      :asset => %{ :votes => votes },
      :signature => nil,
      :sign_signature => nil,
      :id => nil
    }

    add_signatures_and_create_id(transaction, secret, second_secret)
  end


  @spec create_second_signature(String.t(), String.t()) :: Map
  def create_second_signature(second_secret, first_secret) do
    key = ArkElixir.Util.EcKey.get_private_key(first_secret)
    second_key = ArkElixir.Util.EcKey.get_private_key(second_secret)

    transaction = %{
      :type => TransactionType.second_signature,
      :fee => TransactionFee.second_signature,
      :sender_public_key => ArkElixir.Util.EcKey.private_key_to_public_key(key),
      :asset => %{
        :signature => %{
          :public_key => ArkElixir.Util.EcKey.private_key_to_public_key(second_key)
        }
      },
      :amount => 0,
      :timestamp => __MODULE__.seconds_since_epoch,
      :signature => nil,
      :sign_signature => nil,
      :id => nil
    }

    add_signatures_and_create_id(transaction, first_secret)
  end

  @spec create_delegate(String.t(), String.t(), String.t()) :: Map
  def create_delegate(username, secret, second_secret \\ nil) do
    key = ArkElixir.Util.EcKey.get_private_key(secret)

    transaction = %{
      :type => TransactionType.delegate,
      :fee => TransactionFee.delegate,
      :sender_public_key => ArkElixir.Util.EcKey.private_key_to_public_key(key),
      :asset => %{
        :delegate => %{
          :username => username
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

  @spec create_multisignature(String.t(), String.t(), List.t(), Integer.t(), Integer.t()) :: Map
  def create_multisignature(secret, second_secret, keysgroup, lifetime, min) do
    key = ArkElixir.Util.EcKey.get_private_key(secret)

    transaction = %{
      :type => TransactionType.multisignature,
      :fee => (1 + length(keysgroup)) * TransactionFee.multisignature_base,
      :sender_public_key => ArkElixir.Util.EcKey.private_key_to_public_key(key),
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

  def seconds_since_epoch do
    :os.system_time(:seconds) - @ark_epoch
  end

  defp get_bytes(transaction, skip_signature \\ true, skip_second_signature \\ true) do
    type = <<transaction[:type]>>
    timestamp =  <<transaction[:timestamp]::little-32>>

    sender_public_key = transaction[:sender_public_key]
                        |> String.upcase
                        |> Base.decode16
                        |> elem(1)

    recipient_id = if transaction[:recipient_id] do
      ArkElixir.Util.Base58Check.decode58check(transaction[:recipient_id])
    else
      String.duplicate(<<0>>, 21)
    end

    vendor_field = if transaction[:vendor_field] do
      vf = transaction[:vendor_field]
      vf_length = String.length(vf)

      if vf_length >= 64 do
        String.slice(vf, 0..63)
      else
        vf <> String.duplicate(<<0>>, 64 - vf_length)
      end
    else
      String.duplicate(<<0>>, 64)
    end

    amount = <<transaction[:amount]::little-64>>
    fee = <<transaction[:fee]::little-64>>

    asset_info = cond do
      transaction[:type] == TransactionType.transfer ->
        <<>>

      transaction[:type] == TransactionType.second_signature ->
        transaction[:asset][:signature][:public_key]
          |> String.upcase
          |> Base.decode16
          |> elem(1)

      transaction[:type] == TransactionType.delegate ->
        transaction[:asset][:delegate][:username]

      transaction[:type] == TransactionType.vote ->
        Enum.join(transaction[:asset][:votes], "")

      transaction[:type] == TransactionType.multisignature ->
        ms_asset = transaction[:asset][:multisignature]
        <<ms_asset[:min]>> <> <<ms_asset[:lifetime]>> <> Enum.join(ms_asset[:keysgroup], "")
    end

    signature = if !skip_signature && transaction[:signature] do
      transaction[:signature]
        |> String.upcase
        |> Base.decode16
        |> elem(1)
    else
      <<>>
    end

    second_signature = if !skip_second_signature && transaction[:sign_signature] do
      transaction[:sign_signature]
        |> String.upcase
        |> Base.decode16
        |> elem(1)
    else
      <<>>
    end

    type <> timestamp <> sender_public_key <> recipient_id <> vendor_field <> amount <> fee <> asset_info <> signature <> second_signature
  end

  defp add_signatures_and_create_id(transaction, secret, second_secret \\ nil) do
    signature = get_bytes(transaction) |> ArkElixir.Util.EcKey.sign(secret)

    transaction = %{transaction | :signature => signature}

    transaction = if second_secret do
      sign_signature = get_bytes(transaction, false) |> ArkElixir.Util.EcKey.sign(second_secret)
      %{transaction | :sign_signature => sign_signature}
    else
      transaction
    end

    id = :crypto.hash(:sha256, get_bytes(transaction, false, false))
         |> Base.encode16
         |> String.downcase

    %{ transaction | :id => id }
  end
end
