defmodule ArkElixir.Delegate do
  @moduledoc """
  Documentation for ArkElixir.Delegate.
  """

  import ArkElixir

  @doc """
  DEPRECATED: CREATE DELEGATE

  ## Examples

      iex> ArkElixir.Delegate.create(client)
      :world

  """
  @spec create(Tesla.Client.t(), String.t(), String.t(), String.t()) :: ArkElixir.response()
  def create(_client, _secret, _username, _second_secret \\ nil) do
    raise "POST /api/delegates is deprecated."
  end

  @doc """
  Get the count of delegates.

  ## Examples

      iex> ArkElixir.Delegate.count(client)
      %{"count" => 175, "success" => true}

  """
  @spec count(Tesla.Client.t()) :: ArkElixir.response()
  def count(client) do
    get(client, "api/delegates/count")
  end

  @doc """
  Get a single delegate.

  ## Examples

      iex> ArkElixir.Delegate.delegate(client)
      %{"delegate" => %{"address" => "DARiJqhogp2Lu6bxufUFQQMuMyZbxjCydN", "approval" => 4.38, "missedblocks" => 1040, "producedblocks" => 48007, "productivity" => 97.88, "publicKey" => "022cca9529ec97a772156c152a00aad155ee6708243e65c9d211a589cb5d43234d", "rate" => 1, "username" => "boldninja", "vote" => "568898457592544"}, "success" => true}

  """
  @spec delegate(Tesla.Client.t(), Keyword.t()) :: ArkElixir.response()
  def delegate(client, parameters \\ []) do
    get(client, "api/delegates/get", query: parameters)
  end

  @doc """
  Get all delegates.

  ## Examples

      iex> ArkElixir.Delegate.delegates(client)
      %{"delegates" => [%{"address" => "DARiJqhogp2Lu6bxufUFQQMuMyZbxjCydN", "approval" => 4.38, "missedblocks" => 1040, "producedblocks" => 48007, "productivity" => 97.88, "publicKey" => "022cca9529ec97a772156c152a00aad155ee6708243e65c9d211a589cb5d43234d", "rate" => 1, "username" => "boldninja", "vote" => "568898457592544"}, %{"address" => "DBi2HdDY8TqMCD2aFLVomEF92gzeDmEHmR", "approval" => 0.38, "missedblocks" => 1936, "producedblocks" => 49545, "productivity" => 96.24, "publicKey" => "03bd4f16e39aaba5cba6a87b7498b08ce540f279be367e68ae96fb05dfabe203ad", "rate" => 2, "username" => "darkjarunik", "vote" => "49148583537472"}, %{"address" => "DHPMKLFC4Y2NkwB4kxSCF2ySNyxmcDQ3qR", "approval" => 0.31, "missedblocks" => 1369, "producedblocks" => 48679, "productivity" => 97.26, "publicKey" => "032fe001dff675a6edfe3d0e51201b2900d3b5050a46d770306aefaa574c022672", "rate" => 3, "username" => "drafty", "vote" => "40750583550216"}, %{"address" => "DB8LnnQqYvHpG4WkGJ9AJWBYEct7G3yRZg", "approval" => 0.24, "missedblocks" => 376, "producedblocks" => 29492, "productivity" => 98.74, "publicKey" => "0265c1f6b8c1966a90f3fed7bc32fd4f42238ab4938fdb2a4e7ddd01ae8b58b4c0", "rate" => 4, "username" => "ark_galp", "vote" => "30934496829767"}, %{"address" => "DTrc2RnsWWJS13zUrQsKJk882KAeoWfnSk", "approval" => 0.13, "missedblocks" => 284, "producedblocks" => 29501, "productivity" => 99.05, "publicKey" => "03794e95585ab18fd95c963cfb2ec24f37ad159f6a43e05dd826577b58a32de309", "rate" => 5, "username" => "ghostfaceuk", "vote" => "16964160000000"}, %{"address" => "DJmr887qE9pZ374tAEnzcnR3hZqGJ5DYwM", "approval" => 0.12, "missedblocks" => 318, "producedblocks" => 25392, "productivity" => 98.76, "publicKey" => "03ea30ad4c2c5906061b09fac51a6f4b7765e59091ddd101af28d1ec901d42b41f", "rate" => 6, "username" => "calidark", "vote" => "16230360000000"}, %{"address" => "DMSwarrHg5N9ZAZ6nsqPuUjyAU6gdRAM9d", "approval" => 0.12, "missedblocks" => 44, "producedblocks" => 11050, "productivity" => 99.6, "publicKey" => "037def83d085778d7767a182a179f345207953441089081f5bc13f86d3891308aa", "rate" => 7, "username" => "genesis_4", "vote" => "14999300000000"}, %{"address" => "DG9LYv5rqX67wuGvGVa9is5k1r86LKCVTA", "approval" => 0.12, "missedblocks" => 1490, "producedblocks" => 22815, "productivity" => 93.87, "publicKey" => "031137050d5fed0b5229b150257da2ac9c135efdf4bcb382b0ad0c197d7be458f4", "rate" => 8, "username" => "genesis_3", "vote" => "14998800000000"}, %{"address" => "DEfBCw4cDzSGSc1DBhRqQNgQ75eX4ewgCi", "approval" => 0.12, "missedblocks" => 491, "producedblocks" => 32928, "productivity" => 98.53, "publicKey" => "022ddcddb2cdfb106780904fa15e0908fb5a1ece629c148bb954a1ecef161535e5", "rate" => 9, "username" => "d_reconnico", "vote" => "14996600000000"}, %{"address" => "D7K3KFBESSwPqEYDBdgY5XLRUKZuxNKtun", "approval" => 0.11, "missedblocks" => 2754, "producedblocks" => 49974, "productivity" => 94.78, "publicKey" => "02b7b740973db16cd9c6f0f6f2bc160d27cd2a855e172d887833141bec234eb80c", "rate" => 10, "username" => "arkvader", "vote" => "14519330000000"}, %{"address" => "DQPr5WHkhau3Ka2RKb7egm7isr5wbNHbF1", "approval" => 0.1, "missedblocks" => 13, "producedblocks" => 3730, "productivity" => 99.65, "publicKey" => "03ce7fbbdd946ec0c720ad37d541e269862be887c23075369955a279e46ab312a9", "rate" => 11, "username" => "lambo", "vote" => "13132718602525"}, %{"address" => "DEig5G83hAFgcmNXtpFQVoVAoexeMdKQ2E", "approval" => 0.09, "missedblocks" => 993, "producedblocks" => 5884, "productivity" => 85.56, "publicKey" => "031f3dffe4d10f78d85806d6b46f9c9a116e1aa56e8c538da2e02a416ff654b1db", "rate" => 12, "username" => "darkdelegate", "vote" => "12016841842889"}, %{"address" => "D9K4pTDqHF4r8NNabfD54GEvAxsVL729Lx", "approval" => 0.09, "missedblocks" => 208, "producedblocks" => 44563, "productivity" => 99.54, "publicKey" => "028f0a25321cd9d3bf051b34a835cd5eee0125120c17654bc95790f8f2d970dc46", "rate" => 13, "username" => "sonobit", "vote" => "11885570000000"}, %{"address" => "DDxsJSSvEUgMPo6o4tYmMdVsSXAEBm38d5", "approval" => 0.09, "missedblocks" => 27, "producedblocks" => 6123, "productivity" => 99.56, "publicKey" => "03304b1bce52085440556c1d126796ae393181c210ea67915db447d2317c4c5001", "rate" => 14, "username" => "zillion", "vote" => "11297023217470"}, %{"address" => "DRkVSeW5e2zh9v7R5msdLc26fo8axFALGT", "approval" => 0.09, "missedblocks" => 581, "producedblocks" => 35061, "productivity" => 98.37, "publicKey" => "0284a88da69cc04439633217c6961d2800df0f7dff7f85b9803848ee02d0743f1d", "rate" => 15, "username" => "bioly", "vote" => "11068643400000"}, %{"address" => "DN1F1LhDgmPqvr6UhMjxU7G7ud6uZ6SrNd", "approval" => 0.08, "missedblocks" => 1528, "producedblocks" => 16937, "productivity" => 91.72, "publicKey" => "0200af8a7a8572bcb3fcd305248343358198c8ed5bd004bbacfb16e7f0b09e532b", "rate" => 16, "username" => "thales", "vote" => "11016570000000"}, %{"address" => "DBzxo7nb1DfV5ZihXzUtoBZjrqT7dypXzS", "approval" => 0.08, "missedblocks" => 1296, "producedblocks" => 4694, "productivity" => 78.36, "publicKey" => "03defedb4c1e593c38f3dc9de400a893bbe744077c1fb3c9928c659498127174d5", "rate" => 17, "username" => "arkadia_dark", "vote" => "10961390000000"}, %{"address" => "DFcYHfCwhGWcBNy6cp48wy5SfXbQmfBYgT", "approval" => 0.08, "missedblocks" => 1575, "producedblocks" => 15483, "productivity" => 90.77, "publicKey" => "033f28ad2e9b897d46f1e67c7c52070e9ca46b04c0679ebb21fb236719e38aade3", "rate" => 18, "username" => "genesis_5", "vote" => "10430828940703"}, %{"address" => "D913NJMskSEHT6fLJ4Z7zbBhwto9ChKvZU", "approval" => 0.08, "missedblocks" => 6330, "producedblocks" => 22251, "productivity" => 77.85, "publicKey" => "02ce086b1e1609c691c0d2e0670a15248a7244195798bcc578b12133fe04defe59", "rate" => 19, "username" => "rob", "vote" => "10425850000000"}, %{"address" => "DE6os4N86ef9bba6kVGurqxmhpBHKctoxY", "approval" => 0.08, "missedblocks" => 3578, "producedblocks" => 22132, "productivity" => 86.08, "publicKey" => "0307f47713350c06682d3514e8db930b6fd83b2d22e7baaa1a9a0a7db9cd805a60", "rate" => 20, "username" => "lorenzo", "vote" => "10397280671826"}, %{"address" => "DK6Q1Lufhb939H9EshLViYbaaKUkswMiUz", "approval" => 0.08, "missedblocks" => 4218, "producedblocks" => 20126, "productivity" => 82.67, "publicKey" => "0257b7724e97cd832e0c28533a86da5220656f9b5122141daab20e8526decce01f", "rate" => 21, "username" => "dev.interest", "vote" => "10175280000000"}, %{"address" => "DNL81CT6WNG1PHjobBmLvKwLV3UUscBymB", "approval" => 0.08, "missedblocks" => 41, "producedblocks" => 7263, "productivity" => 99.44, "publicKey" => "03e5b39a83e6c7c952c5908089d4524bb8dda93acc2b2b953247e43dc4fe9aa3d1", "rate" => 22, "username" => "genesis_1", "vote" => "10132178017111"}, %{"address" => "DDAHPjVTTV3uur653TB27fcLGh7XXWnvxW", "approval" => 0.08, "missedblocks" => 93, "producedblocks" => 30618, "productivity" => 99.7, "publicKey" => "02845161cfca4d6ddde8e0d53538b6f881fb3ad9383cd77cebc55375dd6fd17663", "rate" => 23, "username" => "genesis_8", "vote" => "10008700000000"}, %{"address" => "D5e2FzTPqdEHridjzpFZCCVyepAu6Vpmk4", "approval" => 0.08, "missedblocks" => 872, "producedblocks" => 29136, "productivity" => 97.09, "publicKey" => "023e577a7b3362e0aba70e6911d230e86d729b4cb640f0e0b25637b812a3e38b53", "rate" => 24, "username" => "genesis_6", "vote" => "9999700000000"}, %{"address" => "DDLbnve6XK48cGsQiFhesUJQRQdKkZTfPh", "approval" => 0.08, "missedblocks" => 362, "producedblocks" => 27509, "productivity" => 98.7, "publicKey" => "02af5e6341efc14f4ba39a9ff65e151cc7304fc742ce7b2678d9aa446c555ee9c1", "rate" => 25, "username" => "genesis_7", "vote" => "9999700000000"}, %{"address" => "DL7Y6smfHHs3Ms3hAYmSYYd5PZukmtDY1i", "approval" => 0.08, "missedblocks" => 47, "producedblocks" => 7287, "productivity" => 99.36, "publicKey" => "03efd265a086c2a099cda4f4fd202adbac07567e1229ce5e6fe39963b714c1e2d5", "rate" => 26, "username" => "genesis_10", "vote" => "9999600000000"}, %{"address" => "DFHdEBuVCz5zfj8yeo3BmKEdsEKpMaYRRw", "approval" => 0.08, "missedblocks" => 46, "producedblocks" => 5165, "productivity" => 99.12, "publicKey" => "03f264a6d2ebb62279313a6fd7fec4e2244785839b625a0b0c261e689ce5401d87", "rate" => 27, "username" => "genesis_9", "vote" => "9999300000000"}, %{"address" => "D9rv3h61heDYHQ3b3Xk3V5epHSTTC6Vn1d", "approval" => 0.08, "missedblocks" => 85, "producedblocks" => 23310, "productivity" => 99.64, "publicKey" => "03127001718bee76f14133272f0f4a928ffa8c2b38cafd94d7100253dac732c644", "rate" => 28, "username" => "genesis_2", "vote" => "9998700000000"}, %{"address" => "DR23FuR1M9GPaknEFSP6QCbsaHnTMdgkFu", "approval" => 0.07, "missedblocks" => 10596, "producedblocks" => 42592, "productivity" => 80.08, "publicKey" => "031e195f2ba9afcfbea54866b0dac663f568620fb098fdea239f87b4e36c282e44", "rate" => 29, "username" => "dravelou", "vote" => "9235873000000"}, %{"address" => "DAZA9otpg7J3pAe9F2TukUa1hjCQnArMk8", "approval" => 0.07, "missedblocks" => 289, "producedblocks" => 42497, "productivity" => 99.32, "publicKey" => "03c638259e874e38bb9621f29a907c3e2445b5bd61c76c3c3098bff83ebabbfeab", "rate" => 30, "username" => "darksid", "vote" => "9049540000000"}, %{"address" => "DHQ4Fjsyiop3qBR4otAjAu6cBHkgRELqGA", "approval" => 0.07, "missedblocks" => 3160, "producedblocks" => 36385, "productivity" => 92.01, "publicKey" => "0275776018638e5c40f1b922901e96cac2caa734585ef302b4a2801ee9a338a456", "rate" => 31, "username" => "sleepdeficit", "vote" => "8574525341862"}, %{"address" => "DU5SfeCnoHV9n11cWe3YDWuf6BCyy4uwEk", "approval" => 0.06, "missedblocks" => 37, "producedblocks" => 4222, "productivity" => 99.13, "publicKey" => "024856c98b2ec1944c5dde44a3a551b394f47f2176c39d9351cc492d1ec323211e", "rate" => 32, "username" => "xillion", "vote" => "8445210000000"}, %{"address" => "DGjvkEHbyxggxPXJEoZwJxQQQcjDxgRwAy", "approval" => 0.06, "missedblocks" => 234, "producedblocks" => 22664, "productivity" => 98.98, "publicKey" => "03b688ac6e5de290e4ab06e0d26f24db352334ff1491ea8a7d104f6c5e0753e90e", "rate" => 33, "username" => "letsgetnaked", "vote" => "8217870000001"}, %{"address" => "D5PXQVeJmchVrZFHL7cALZK8mWWzjCaVfz", "approval" => 0.06, "missedblocks" => 622, "producedblocks" => 47861, "productivity" => 98.72, "publicKey" => "02a9a0ac34a94f9d27fd9b4b56eb3c565a9a3f61e660f269775fb456f7f3301586", "rate" => 34, "username" => "dark_jmc", "vote" => "7926779999900"}, %{"address" => "DTxxPEyZQDGCfCAsAQdvtkgjiXo6guHQaG", "approval" => 0.06, "missedblocks" => 2218, "producedblocks" => 12493, "productivity" => 84.92, "publicKey" => "031c3a1f0d42e9a0fbbd55fd4299f3d39c78f6e426e4f6f8a9e1d859d0de674711", "rate" => 35, "username" => "orange", "vote" => "7517510000000"}, %{"address" => "DH4Zy9TTHtiHYvzaomk2PJR13tzsmneQSo", "approval" => 0.06, "missedblocks" => 148, "producedblocks" => 32377, "productivity" => 99.54, "publicKey" => "020f5df4d2bc736d12ce43af5b1663885a893fade7ee5e62b3cc59315a63e6a325", "rate" => 36, "username" => "kolap", "vote" => "7460750000000"}, %{"address" => "D8vCDNbhPk3gPtWowcnQASLWhzzZMeg6X8", "approval" => 0.06, "missedblocks" => 132, "producedblocks" => 30330, "productivity" => 99.57, "publicKey" => "0326580718fc86ba609799ac95fcd2721af259beb5afa81bfce0ab7d9fe95de991", "rate" => 37, "username" => "geops", "vote" => "7326060000000"}, %{"address" => "D9DyZoqNggbnGp9dMtpKwsBDpsYxGQy66D", "approval" => 0.06, "missedblocks" => 543, "producedblocks" => 28720, "productivity" => 98.14, "publicKey" => "02dc13fcb190bcfbe9e7ecfc6269635ed2c497a75bab471f2b15c1a99897da97b3", "rate" => 38, "username" => "arktothemoon", "vote" => "7288470000000"}, %{"address" => "DKfEF2sykKCZzom3vFg1dp9D2kisB8hM2Q", "approval" => 0.06, "missedblocks" => 1008, "producedblocks" => 15342, "productivity" => 93.83, "publicKey" => "036a520acf24036ff691a4f8ba19514828e9b5aa36ca4ba0452e9012023caccfef", "rate" => 39, "username" => "munich", "vote" => "7177824022057"}, %{"address" => "DSHrJ5tyqcbbu44GkXiUKf7YyY1FXspZ3i", "approval" => 0.05, "missedblocks" => 182, "producedblocks" => 32550, "productivity" => 99.44, "publicKey" => "0299deebff24ebf2bb53ad78f3ea3ada5b3c8819132e191b02c263ee4aa4af3d9b", "rate" => 40, "username" => "benbenz", "vote" => "6986160000000"}, %{"address" => "DHwLCgbGwognuapEP7Pb4rve8yFkL2BABL", "approval" => 0.05, "missedblocks" => 427, "producedblocks" => 29465, "productivity" => 98.57, "publicKey" => "02ac90cbb1e8f0cf1983d5090f1a289f272a1e4e45f53e9a000579dff78cd3e4d2", "rate" => 41, "username" => "danielsan", ...}, %{"address" => "DJ1J2NiRm8ZzhzXMBxi7sft8DVksLVjY6j", "approval" => 0.05, "missedblocks" => 2019, "producedblocks" => 26933, "productivity" => 93.03, "publicKey" => "0255ba820d684e5f5f3cff31da03cb95e2d2aebd9b8609df8d16f17853c5ecb6a2", "rate" => 42, ...}, %{"address" => "DCL1QSZVT9jcrN8DNGRTTEyvLeGgcoC294", "approval" => 0.05, "missedblocks" => 416, "producedblocks" => 28780, "productivity" => 98.58, "publicKey" => "022dbae11218cbd64038c2cd1261d2a5ddbd9d6ce87ee92bac7b34f9d1c79970e5", ...}, %{"address" => "DNfK7HEZJnYswSfFYB44HGhxtAKrVgBJqE", "approval" => 0.05, "missedblocks" => 1932, "producedblocks" => 28885, "productivity" => 93.73, ...}, %{"address" => "D7P41dV7s259L3P7BVPNyqExqNDC7vdfx9", "approval" => 0.05, "missedblocks" => 2588, "producedblocks" => 26168, ...}, %{"address" => "DLsCPHjjq1XL52hdHoJ91A56W7DR2faUu3", "approval" => 0.05, "missedblocks" => 2163, ...}, %{"address" => "DFyLKkWs12QwDTi8BywQN5ssa5CMK3dr6d", "approval" => 0.05, ...}, %{"address" => "DEf1iRV9p2HmPcxem6qxzi1qQF7KJjkc7P", ...}, %{...}, ...], "success" => true, "totalCount" => 175}

  """
  @spec delegates(Tesla.Client.t(), Keyword.t()) :: ArkElixir.response()
  def delegates(client, parameters \\ []) do
    get(client, "api/delegates", query: parameters)
  end

  @doc """
  Disable forging for a delegate.

  ## Examples

      iex> ArkElixir.Delegate.disable_forging(client)
      :world

  """
  @spec disable_forging(
    Tesla.Client.t(),
    String.t(),
    Keyword.t()
  ) :: ArkElixir.response()
  def disable_forging(_client, _secret, _parameters \\ []) do
    raise "api/delegates/forging/disable has been deprecated."
  end

  @doc """
  Enable forging for a delegate.

  ## Examples

      iex> ArkElixir.Delegate.enable_forging(client)
      :world

  """
  @spec enable_forging(
    Tesla.Client.t(),
    String.t(),
    Keyword.t()
  ) :: ArkElixir.response()
  def enable_forging(_client, _secret, _parameters \\ []) do
    raise "api/delegates/forging/enable has been deprecated."
  end

  @doc """
  Get Delegate Fee

  ## Examples

      iex> ArkElixir.Delegate.fee(client)
       %{"fee" => 2500000000, "success" => true}

  """
  @spec fee(Tesla.Client.t()) :: ArkElixir.response()
  def fee(client) do
    get(client, "api/delegates/fee")
  end

  @doc """
  Get the amount of ARKs forged by an account.

  ## Examples

      iex> ArkElixir.Delegate.forged_by_account(client)
      %{"fees" => "61110000000", "forged" => "9662510000000", "rewards" => "9601400000000", "success" => true}

  """
  @spec forged_by_account(Tesla.Client.t(), String.t()) :: ArkElixir.response()
  def forged_by_account(client, generatorPublicKey) do
    get(
      client,
      "api/delegates/forging/getForgedByAccount",
      query: [generatorPublicKey: generatorPublicKey]
    )
  end

  @doc """
  Hello world..

  ## Examples

      iex> ArkElixir.Delegate.forging_status(client)
      %{"enabled" => false, "success" => true}

  """
  @spec forging_status(
    Tesla.Client.t(),
    String.t(),
    Keyword.t()
  ) :: ArkElixir.response()
  def forging_status(client, public_key, parameters \\ []) do
    get(
      client,
      "api/delegates/forging/status",
      query: [publicKey: public_key] ++ parameters
    )
  end

  @doc """
  Get the next forger.

  ## Examples

      iex> ArkElixir.Delegate.next_forgers(client)
      :world

  """
  @spec next_forgers(Tesla.Client.t()) :: ArkElixir.response()
  def next_forgers(client) do
    get(client, "api/delegates/getNextForgers")
  end

  @doc """
  Search for specific delegates.

  ## Examples

      iex> ArkElixir.Delegate.search(client)
      {"delegates" => [%{"address" => "DARiJqhogp2Lu6bxufUFQQMuMyZbxjCydN", "missedblocks" => 1040, "producedblocks" => 48007, "publicKey" => "022cca9529ec97a772156c152a00aad155ee6708243e65c9d211a589cb5d43234d", "username" => "boldninja", "vote" => "568898457592544"}], "success" => true}

  """
  @spec search(
    Tesla.Client.t(),
    String.t(),
    Keyword.t()
  ) :: ArkElixir.response()
  def search(client, q, parameters \\ []) do
    get(client, "api/delegates/search", query: [q: q] ++ parameters)
  end

  @doc """
  Get a list of voters for a delegate.

  ## Examples

      iex> ArkElixir.Delegate.voters(client)
      %{"accounts" => [%{"address" => "D5mbS6mpP5UheuciNscpDLgC127kYjRtkK", "balance" => "400000000", "publicKey" => "03f7e0b1ab14985990416f72ed0b206c20b9efa35156e4528c8ff749fa0eea5d5a", "username" => nil}, %{"address" => "DAbS5fjo6ywB7H7AabDa7YUC6DiP4Ddtbm", "balance" => "2415000000", "publicKey" => "02518f4fb4db2ec890eed6699c055f47b7a7d7e7377a5e7a9ca9582d6b69df6341", "username" => nil}, %{"address" => "DQNCMPKWq3VEK2k5sqovqSZAZJiLJJYrir", "balance" => "4790000000", "publicKey" => "0369f2458b8eac42e000dde4cb4a90f873eeb91230aeb3c4d947672f4c0c13a9b8", "username" => nil}, %{"address" => "DMmu1XZQec7P5Wyzws5fT8zXexwi7iuB44", "balance" => "4900000000", "publicKey" => "0358acc757c1605a4a13b455527f0f3831d009a2c100944022c104d210ff3ceae9", "username" => nil}, %{"address" => "DQ9g4wop6YaAFWyBRcXN2TrzixsCo3uooN", "balance" => "9470000000", "publicKey" => "028a9b19e4df00853e22a9995fd21881fbc1417e60ac7ecfb27c3401db41b36412", "username" => nil}, %{"address" => "DTkFJwS5HS76HBuoUzDoxfp1vspWGRx7bk", "balance" => "12279699000", "publicKey" => "02d3f32e0a0b413a76b27ad7ed97ec2e1d1ab7dd0278f743d1f3cfc6ebba093123", "username" => nil}, %{"address" => "DEfaZF37s642PK8PmBfW9EBid6gJiHTQFP", "balance" => "17380000000", "publicKey" => "03b00fa5338415f518b36291598b7cca3598391fc7072f282331c486eb7bc9fc5b", "username" => "blove"}, %{"address" => "DLMbyaE3fPxzG9AQkRHJmM6EsiqTYtxLTX", "balance" => "17560000000", "publicKey" => "032a401a7946437e92a334f9d3e2dc3ff50b25498e85ef28d4399b8d808e1ebbe8", "username" => nil}, %{"address" => "D7u5Ro3WihcbWFgxSGcqpqJypVeaLpfFw7", "balance" => "50959999997", "publicKey" => "0289f519c77e4e9f5438c2ae5ac2978efcc91fd53c15bc17f63ad5de3bf47a00a3", "username" => "iamatest"}, %{"address" => "DPUHwWwSnr2oyezoU2yJhDLpUr7bbHj3Rj", "balance" => "160586600000", "publicKey" => "03f6ca4a4c316f89e891aecfd7d82d2b8248e0cb3026e500a4881866781b663ab1", "username" => nil}, %{"address" => "DL8eXf1BsuJMn4icijWxzhEnRXzkNFfcq7", "balance" => "503200000000", "publicKey" => "0384f5055821cbc678a73906b0c2fd9adb2120b571721a2c9c9baa77ef2da4e7f8", "username" => "bilaridis90"}, %{"address" => "DSq9yKLi6TBcYeSMMYYaYitbDz9tF5xvDq", "balance" => "4998700000000", "publicKey" => "03bddc715176f92e497315de6a125ed856803c32b313dd6aa4448ccb4118c981ee", "username" => nil}, %{"address" => "DHawRTCWDw4e4YaPyF8QEdWUmxiwtVmQ5z", "balance" => "4998900000000", "publicKey" => "03858b0ce14bf4b636a4df9aa75e7b5ba860350f64dd4f07ddf3e0ec6edd1942be", "username" => nil}, %{"address" => "DRac35wghMcmUSe5jDMLBDLWkVVjyKZFxK", "balance" => "558116916293547", "publicKey" => "0374e9a97611540a9ce4812b0980e62d3c5141ea964c2cab051f14a78284570dcd", "username" => nil}], "success" => true}

  """
  @spec voters(Tesla.Client.t(), String.t()) :: ArkElixir.response()
  def voters(client, public_key) do
    get(client, "api/delegates/voters", query: [publicKey: public_key])
  end
end
