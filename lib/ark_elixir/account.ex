defmodule ArkElixir.Account do
  @moduledoc """
  Documentation for ArkElixir.Account.
  """

  import ArkElixir

  @doc """
  Get an account.

  ## Examples

      iex> ArkElixir.Account.account(client)
      %{"account" => %{"address" => "DLsCPHjjq1XL52hdHoJ91A56W7DR2faUu3", "balance" => "6515950000000", "multisignatures" => [], "publicKey" => "02df2f0ef3e8b590e556dc5f81853b5dda8ba3543344d28f321e55bf029cede229", "secondPublicKey" => nil, "secondSignature" => 0, "u_multisignatures" => [], "unconfirmedBalance" => "6515950000000", "unconfirmedSignature" => 0}, "success" => true}

  """
  @spec account(Tesla.Client.t(), String.t()) :: ArkElixir.response()
  def account(client, address) do
    get(client, "api/accounts", [address: address])
  end

  @doc """
  Get the balance of an account.

  ## Examples

      iex> ArkElixir.Account.balance(client)
      %{"balance" => "6515950000000", "success" => true, "unconfirmedBalance" => "6515950000000"}

  """
  @spec balance(Tesla.Client.t(), String.t()) :: ArkElixir.response()
  def balance(client, address) do
    get(client, "api/accounts/getBalance", query: [address: address])
  end

  @doc """
  Get the delegates of an account.

  ## Examples

      iex> ArkElixir.Account.delegates(client)
      %{"delegates" => [%{"address" => "DLsCPHjjq1XL52hdHoJ91A56W7DR2faUu3", "approval" => 0.05, "missedblocks" => 2163, "producedblocks" => 27095, "productivity" => 92.61, "publicKey" => "02df2f0ef3e8b590e556dc5f81853b5dda8ba3543344d28f321e55bf029cede229", "rate" => 46, "username" => "patap", "vote" => "6515950000000"}], "success" => true}

  """
  @spec delegates(
    Tesla.Client.t(),
    String.t(),
    Keyword.t()
  ) :: ArkElixir.response()
  def delegates(client, address, parameters) do
    get(client, "api/accounts/delegates", query: [address: address] ++ parameters)
  end

  @doc """
  Get the delegate fee of an account.

  ## Examples

      iex> ArkElixir.Account.fee(client)
       %{"fee" => 2500000000, "success" => true}

  """
  @spec fee(Tesla.Client.t()) :: ArkElixir.response()
  def fee(client) do
    get(client, "api/accounts/delegates/fee")
  end

  @doc """
  Get the public key of an account.

  ## Examples

      iex> ArkElixir.Account.publickey(client)
      %{"publicKey" => "02df2f0ef3e8b590e556dc5f81853b5dda8ba3543344d28f321e55bf029cede229", "success" => true}

  """
  @spec publickey(Tesla.Client.t(), String.t()) :: ArkElixir.response()
  def publickey(client, address) do
    get(client, "api/accounts/getPublickey", query: [address: address])
  end

  @doc """
  Get a list of top accounts.

  ## Examples

      iex> ArkElixir.Account.top(client)
      %{"accounts" => [%{"address" => "DGihocTkwDygiFvmg6aG8jThYTic47GzU9", "balance" => "11499593462120631", "publicKey" => "024c8247388a02ecd1de2a3e3fd5b7c61ecc2797fa3776599d558333ef1802d231"}, %{"address" => "DRac35wghMcmUSe5jDMLBDLWkVVjyKZFxK", "balance" => "558116916293547", "publicKey" => "0374e9a97611540a9ce4812b0980e62d3c5141ea964c2cab051f14a78284570dcd"}, %{"address" => "DLkmdWyXYEGtNGPHohgmvYMt2UNfFebUDd", "balance" => "18183240337205", "publicKey" => "03089a66fac174ad94dfa07ec50b41545cd1d5696af0c9f34ed306ff8d7f1d4ba6"}, %{"address" => "D7K3KFBESSwPqEYDBdgY5XLRUKZuxNKtun", "balance" => "14519330000000", "publicKey" => "02b7b740973db16cd9c6f0f6f2bc160d27cd2a855e172d887833141bec234eb80c"}, %{"address" => "DBgKiVNj6NBjUBNHgVSJn7GEg4Uz6vdgV2", "balance" => "12536489999999", "publicKey" => nil}, %{"address" => "D9K4pTDqHF4r8NNabfD54GEvAxsVL729Lx", "balance" => "11885570000000", "publicKey" => "028f0a25321cd9d3bf051b34a835cd5eee0125120c17654bc95790f8f2d970dc46"}, %{"address" => "DKxo6kjrJENYs7mQj54PKjYPWd58AynHde", "balance" => "10999700000000", "publicKey" => "02a8806369a0f72cb1b2602e1971cdefd077732ceeff93951f4b73a9ec33390357"}, %{"address" => "DKWriVXqskuiTjA52juXaFmcvTx4sphgKy", "balance" => "10430828940703", "publicKey" => "02dca0cff47c992c83bd85618f666911cea0ad098e1313094f484c12d3453ac4dc"}, %{"address" => "DARiJqhogp2Lu6bxufUFQQMuMyZbxjCydN", "balance" => "10165910000000", "publicKey" => "022cca9529ec97a772156c152a00aad155ee6708243e65c9d211a589cb5d43234d"}, %{"address" => "DN6dURZg596cK6FcLq8mDzCbx4waDFPrZz", "balance" => "10132178017111", "publicKey" => "03ecfde38b8cad54b3054664d0820da27ac71fe1c9bccb13dbf94593c6e8094cc7"}, %{"address" => "D7DBmxrKTy9p7ok7Q5kcy9aZFsxYAPV72W", "balance" => "10070303217470", "publicKey" => "026f94617d16c5f0b0111a088ab4fed13c83e6852274093c03b3b6ae109fdce2da"}, %{"address" => "DDeM7E9wsA4M7q6CMYMKhkgswz7AyDpuau", "balance" => "9999700000000", "publicKey" => "0347496fe9c50e1583e64ff29032b7bef253e6a006f6972292c61852cdaf12dbb9"}, %{"address" => "DP5Dza8jHZPLKeaMeakXF2nKCKLSDHPtrK", "balance" => "9999700000000", "publicKey" => "039e40bcb608c904d3fa8fad64bbf72c40ea8d3a076f044bdc57c08b99875f1b52"}, %{"address" => "DSx9rW8E9LBuEQXhijDNvji7Gh5sYcsZ8P", "balance" => "9999300000000", "publicKey" => "03c180c3e268952132387210d3b20c16934ca6e2bfaad80cb6459058c694e5123a"}, %{"address" => "D7PmyK5QMCAWxJoUnxspE2cwgjqY1nT27Q", "balance" => "9999100000000", "publicKey" => "02dc59b121d7554b4f90f360dea23656520ea9b6c9d5a0b3f04bba404fe7599d08"}, %{"address" => "DHYAZwRTLToqjJjRaLwYSiDigYEPo249jN", "balance" => "9998700000000", "publicKey" => "02823d57c67e72b5cba7ad4034d4fbe58b00e68ef618ee0501f812c1a337de4a6f"}, %{"address" => "DR23FuR1M9GPaknEFSP6QCbsaHnTMdgkFu", "balance" => "9236073000000", "publicKey" => "031e195f2ba9afcfbea54866b0dac663f568620fb098fdea239f87b4e36c282e44"}, %{"address" => "DAZA9otpg7J3pAe9F2TukUa1hjCQnArMk8", "balance" => "9049740000000", "publicKey" => "03c638259e874e38bb9621f29a907c3e2445b5bd61c76c3c3098bff83ebabbfeab"}, %{"address" => "DCYehiNen9Gydq6AFm1B3r2g7VrCzrSr4m", "balance" => "8819180000000", "publicKey" => "0381625fdd3019055529348d09d25e33ff48c6201e193ee09320e34b881e2220c1"}, %{"address" => "DHQ4Fjsyiop3qBR4otAjAu6cBHkgRELqGA", "balance" => "8574725341862", "publicKey" => "0275776018638e5c40f1b922901e96cac2caa734585ef302b4a2801ee9a338a456"}, %{"address" => "DGjvkEHbyxggxPXJEoZwJxQQQcjDxgRwAy", "balance" => "8217870000001", "publicKey" => "03b688ac6e5de290e4ab06e0d26f24db352334ff1491ea8a7d104f6c5e0753e90e"}, %{"address" => "D5PXQVeJmchVrZFHL7cALZK8mWWzjCaVfz", "balance" => "7926979999900", "publicKey" => "02a9a0ac34a94f9d27fd9b4b56eb3c565a9a3f61e660f269775fb456f7f3301586"}, %{"address" => "DTxxPEyZQDGCfCAsAQdvtkgjiXo6guHQaG", "balance" => "7517710000000", "publicKey" => "031c3a1f0d42e9a0fbbd55fd4299f3d39c78f6e426e4f6f8a9e1d859d0de674711"}, %{"address" => "D9rcRt9nS5Ajj3PVAbd5yPpLkZNkGys2Lw", "balance" => "7499700000000", "publicKey" => "03362d2d780bdda7a28de74868a52fb739719101e6bf56edceba3a0d9844361a2b"}, %{"address" => "DH4Zy9TTHtiHYvzaomk2PJR13tzsmneQSo", "balance" => "7460750000000", "publicKey" => "020f5df4d2bc736d12ce43af5b1663885a893fade7ee5e62b3cc59315a63e6a325"}, %{"address" => "D8vCDNbhPk3gPtWowcnQASLWhzzZMeg6X8", "balance" => "7326290000000", "publicKey" => "0326580718fc86ba609799ac95fcd2721af259beb5afa81bfce0ab7d9fe95de991"}, %{"address" => "D9DyZoqNggbnGp9dMtpKwsBDpsYxGQy66D", "balance" => "7288470000000", "publicKey" => "02dc13fcb190bcfbe9e7ecfc6269635ed2c497a75bab471f2b15c1a99897da97b3"}, %{"address" => "D7b6JGnnU7tAn1STJmYgKBvJzMAYR7CCqo", "balance" => "7216570000000", "publicKey" => "02311558b9a01862dae34dcb03551743fcdadf227b44ea3cec8c578bb5c1d31f51"}, %{"address" => "DSHrJ5tyqcbbu44GkXiUKf7YyY1FXspZ3i", "balance" => "6986390000000", "publicKey" => "0299deebff24ebf2bb53ad78f3ea3ada5b3c8819132e191b02c263ee4aa4af3d9b"}, %{"address" => "DHwLCgbGwognuapEP7Pb4rve8yFkL2BABL", "balance" => "6932460000000", "publicKey" => "02ac90cbb1e8f0cf1983d5090f1a289f272a1e4e45f53e9a000579dff78cd3e4d2"}, %{"address" => "DJ1J2NiRm8ZzhzXMBxi7sft8DVksLVjY6j", "balance" => "6930320000000", "publicKey" => "0255ba820d684e5f5f3cff31da03cb95e2d2aebd9b8609df8d16f17853c5ecb6a2"}, %{"address" => "DNfK7HEZJnYswSfFYB44HGhxtAKrVgBJqE", "balance" => "6829990000000", "publicKey" => "03d4ec98dfc6f3fe2ccb64a950534709ab6bb9134ae02205822f7cecf4391f03bd"}, %{"address" => "D7P41dV7s259L3P7BVPNyqExqNDC7vdfx9", "balance" => "6782080000000", "publicKey" => "030fa94238eb63db0247a9bd6a3fd810f690b449ee9ce4eb654b94b22875a9a612"}, %{"address" => "DRkVSeW5e2zh9v7R5msdLc26fo8axFALGT", "balance" => "6768250259585", "publicKey" => "0284a88da69cc04439633217c6961d2800df0f7dff7f85b9803848ee02d0743f1d"}, %{"address" => "DEfBCw4cDzSGSc1DBhRqQNgQ75eX4ewgCi", "balance" => "6746699999999", "publicKey" => "022ddcddb2cdfb106780904fa15e0908fb5a1ece629c148bb954a1ecef161535e5"}, %{"address" => "DLsCPHjjq1XL52hdHoJ91A56W7DR2faUu3", "balance" => "6515950000000", "publicKey" => "02df2f0ef3e8b590e556dc5f81853b5dda8ba3543344d28f321e55bf029cede229"}, %{"address" => "DFyLKkWs12QwDTi8BywQN5ssa5CMK3dr6d", "balance" => "6480850000000", "publicKey" => "02cd9f56a176c843724eb58d3ef89dc88915a814bdcf284b02933e0dd203630a83"}, %{"address" => "DEf1iRV9p2HmPcxem6qxzi1qQF7KJjkc7P", "balance" => "6418120000000", "publicKey" => "03d60efa77936605187c7490e19d3955b709b1fedf40f81fe1400844dcf12b7dd3"}, %{"address" => "DTT7ik3yqnzLBVJm5iqG6Ayijtn6M4Pqr6", "balance" => "6372260000000", "publicKey" => "03cbefd8c4286568665c7252197293ba258852b2c511d4f0aaa16d8d5e53b7971d"}, %{"address" => "DRkYdhviW7vCoAvYk79vQReFsiZeDeRxa6", "balance" => "6369100000000", "publicKey" => "02df70fa5cf1687438363c06f97f8e1b67bb565f77ded6988dd46d4456bfdaf4af"}, %{"address" => "DJmr887qE9pZ374tAEnzcnR3hZqGJ5DYwM", "balance" => "6230560000000", "publicKey" => "03ea30ad4c2c5906061b09fac51a6f4b7765e59091ddd101af28d1ec901d42b41f"}, %{"address" => "DLx6irK4zzz1qfjUhJqpc98ShYwpa1R6BV", "balance" => "6227050000000", "publicKey" => "02524ea2e2e9bad0ecbe521756388bf65e0b09dd2877d96495fe60200a97b35ddb"}, %{"address" => "D5H46Q8oVBvk6TTrmqEXBT7pGFsCXehpiQ", "balance" => "6051415587160", "publicKey" => "030da3214fcb817a5534f996897b8bf4dc1e4a017f4f247206c9565beee7ec7fb5"}, %{"address" => "DN1F1LhDgmPqvr6UhMjxU7G7ud6uZ6SrNd", "balance" => "6006770000000", "publicKey" => "0200af8a7a8572bcb3fcd305248343358198c8ed5bd004bbacfb16e7f0b09e532b"}, %{"address" => "DB632agE4NiDnwdnqDRbCtezfYg4yKfArH", "balance" => "5894480000000", "publicKey" => "02525d1434da7e42a6b48609f8014a87f0a449ec82d379d89f8a6dbafefd274292"}, %{"address" => "DQPr5WHkhau3Ka2RKb7egm7isr5wbNHbF1", "balance" => "5883123952081", "publicKey" => "03ce7fbbdd946ec0c720ad37d541e269862be887c23075369955a279e46ab312a9"}, %{"address" => "DDAHPjVTTV3uur653TB27fcLGh7XXWnvxW", "balance" => "5841660000000", ...}, %{"address" => "DCL1QSZVT9jcrN8DNGRTTEyvLeGgcoC294", ...}, %{...}, ...], "success" => true}

  """
  @spec top(Tesla.Client.t(), Keyword.t()) :: ArkElixir.response()
  def top(client, parameters \\ []) do
    get(client, "api/accounts/top", parameters)
  end
end
