defmodule ArkElixir.Block do
  @moduledoc """
  Documentation for ArkElixir.Block.
  """

  import ArkElixir

  alias ArkElixir.Models.Block

  @doc """
  Get block by id.

  ## Examples

      iex> ArkElixir.Block.block(client)
      %{"block" => %{"blockSignature" => "3045022100b813a4a26fd04ea061a9f8c8fb6cfab81e86ec22bd5617bb8fe2d4b6d5f641870220515e5e76b067541d5c4cd042f01820b9a31047dad6468c446f21313461378007", "confirmations" => 9031, "generatorId" => "DRkVSeW5e2zh9v7R5msdLc26fo8axFALGT", "generatorPublicKey" => "0284a88da69cc04439633217c6961d2800df0f7dff7f85b9803848ee02d0743f1d", "height" => 2483208, "id" => "16881146789693253434", "numberOfTransactions" => 0, "payloadHash" => "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", "payloadLength" => 0, "previousBlock" => "9631303942177254572", "reward" => 200000000, "timestamp" => 27549904, "totalAmount" => 0, "totalFee" => 0, "totalForged" => "200000000", "version" => 0}, "success" => true}

  """
  @spec block(Tesla.Client.t(), String.t()) :: ArkElixir.response()
  def block(client, id) do
    get(client, "api/blocks/get", query: [id: id])
  end

  @doc """
  Get all blocks.

  ## Examples

      iex> ArkElixir.Block.blocks(client)
      %{"blocks" => [%{"blockSignature" => "30450221009b7d610115695e5be04cd7473462206ee94adf89949c2c9f30d6f0954cc2ee2902205ef4194e529f8f33c2548e57f96d6b77f22fa3afa6e68a68c479cd62a52b6ce9", "confirmations" => 1, "generatorId" => "DJmr887qE9pZ374tAEnzcnR3hZqGJ5DYwM", "generatorPublicKey" => "03ea30ad4c2c5906061b09fac51a6f4b7765e59091ddd101af28d1ec901d42b41f", "height" => 2492238, "id" => "5588520656518800754", "numberOfTransactions" => 1, "payloadHash" => "7bd8a3b1e9df795c537d8cc9165faac60f56c93416117170656d1a658ebcf824", "payloadLength" => 32, "previousBlock" => "6327372617559171876", "reward" => 200000000, "timestamp" => 27635984, "totalAmount" => 33152, "totalFee" => 10000000, "totalForged" => "210000000", "version" => 0}, %{"blockSignature" => "3045022100a5a6d36d93be22f42712615e909177e214104631ceed46cda162e6b71c14df9a02202051edaae12b8672fe8d8d248f6882793ac440220d02fdaa684a28af5f8f0b12", "confirmations" => 2, "generatorId" => "DR23FuR1M9GPaknEFSP6QCbsaHnTMdgkFu", "generatorPublicKey" => "031e195f2ba9afcfbea54866b0dac663f568620fb098fdea239f87b4e36c282e44", "height" => 2492237, "id" => "6327372617559171876", "numberOfTransactions" => 0, "payloadHash" => "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", "payloadLength" => 0, "previousBlock" => "11696271034913472522", "reward" => 200000000, "timestamp" => 27635968, "totalAmount" => 0, "totalFee" => 0, "totalForged" => "200000000", "version" => 0}, %{"blockSignature" => "304402204d3ec433608629d64a6d64337a31ee41f94298f83ef8eb7d8f142b0477e525260220278ad8e85213b8c42befbed25b41ecbdb2e065a4462168ace7415c5463e60e53", "confirmations" => 3, "generatorId" => "D9K4pTDqHF4r8NNabfD54GEvAxsVL729Lx", "generatorPublicKey" => "028f0a25321cd9d3bf051b34a835cd5eee0125120c17654bc95790f8f2d970dc46", "height" => 2492236, "id" => "11696271034913472522", "numberOfTransactions" => 0, "payloadHash" => "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", "payloadLength" => 0, "previousBlock" => "5770657843200246675", "reward" => 200000000, "timestamp" => 27635960, "totalAmount" => 0, "totalFee" => 0, "totalForged" => "200000000", "version" => 0}, %{"blockSignature" => "3045022100ce3ee89b6ee1472a88cbeae3b0386d8e2523f620d88d0ed6d54f0b6cf816e943022046d1648d71b30460256cdefb64e9a807b0e96d4dfa5baf29f87866a4df792565", "confirmations" => 4, "generatorId" => "DHwLCgbGwognuapEP7Pb4rve8yFkL2BABL", "generatorPublicKey" => "02ac90cbb1e8f0cf1983d5090f1a289f272a1e4e45f53e9a000579dff78cd3e4d2", "height" => 2492235, "id" => "5770657843200246675", "numberOfTransactions" => 2, "payloadHash" => "71fde453baa47653ef9b884156ea5902372e7188c53052c9846c96b96513ef77", "payloadLength" => 64, "previousBlock" => "7525955297929521158", "reward" => 200000000, "timestamp" => 27635952, "totalAmount" => 35568416, "totalFee" => 20000000, "totalForged" => "220000000", "version" => 0}, %{"blockSignature" => "304402200340ea6234fae4617df37dd07bcf994d83f580f8a79f5cc64f99aaa60d5dd0dc022017f5d171033923c537970dab74926b0b32725db0074b3cddd5096bca8ae47f07", "confirmations" => 5, "generatorId" => "D5PXQVeJmchVrZFHL7cALZK8mWWzjCaVfz", "generatorPublicKey" => "02a9a0ac34a94f9d27fd9b4b56eb3c565a9a3f61e660f269775fb456f7f3301586", "height" => 2492234, "id" => "7525955297929521158", "numberOfTransactions" => 3, "payloadHash" => "d07ec02506afdf4525936ec15f92a3bf8bd6c312f2f5b5733a9b5a799a343b1c", "payloadLength" => 96, "previousBlock" => "8983208131412241060", "reward" => 200000000, "timestamp" => 27635936, "totalAmount" => 35709970, "totalFee" => 30000000, "totalForged" => "230000000", "version" => 0}, %{"blockSignature" => "3044022041062b29d22b954c50f30e4999f417dff44d33ccbe17989cd931b84a02dfd2b5022077afab2be07192dc110f6fda9e4f8a043b9efe40f1e38ea490a16744dd5a39a2", "confirmations" => 6, "generatorId" => "DTT7ik3yqnzLBVJm5iqG6Ayijtn6M4Pqr6", "generatorPublicKey" => "03cbefd8c4286568665c7252197293ba258852b2c511d4f0aaa16d8d5e53b7971d", "height" => 2492233, "id" => "8983208131412241060", "numberOfTransactions" => 0, "payloadHash" => "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", "payloadLength" => 0, "previousBlock" => "8873189050807988872", "reward" => 200000000, "timestamp" => 27635928, "totalAmount" => 0, "totalFee" => 0, "totalForged" => "200000000", "version" => 0}, %{"blockSignature" => "30450221009a0911de9af0370c467d56e6c83e97458a9419caaa6840aa1ac21a119235f8600220712eb46081cd7a6692c65486759c63cd5f63cece78119985bd35dc071d3ff95e", "confirmations" => 7, "generatorId" => "DU5SfeCnoHV9n11cWe3YDWuf6BCyy4uwEk", "generatorPublicKey" => "024856c98b2ec1944c5dde44a3a551b394f47f2176c39d9351cc492d1ec323211e", "height" => 2492232, "id" => "8873189050807988872", "numberOfTransactions" => 0, "payloadHash" => "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", "payloadLength" => 0, "previousBlock" => "10399194460796048934", "reward" => 200000000, "timestamp" => 27635912, "totalAmount" => 0, "totalFee" => 0, "totalForged" => "200000000", "version" => 0}, %{"blockSignature" => "3045022100a56be55e4a486b8452f0988cbba18232e7f7f9fd0c539237d7336b3b52756c3802204d9e70d3cee43bc0c43d9eefe212f9ae08294a5cdfeaf7e648d18af217472323", "confirmations" => 8, "generatorId" => "DL7Y6smfHHs3Ms3hAYmSYYd5PZukmtDY1i", "generatorPublicKey" => "03efd265a086c2a099cda4f4fd202adbac07567e1229ce5e6fe39963b714c1e2d5", "height" => 2492231, "id" => "10399194460796048934", "numberOfTransactions" => 3, "payloadHash" => "a2d1cce9b15dc084a91a34156644060345ace67e28004467e1bed6ae48bc198e", "payloadLength" => 96, "previousBlock" => "17140593873483060938", "reward" => 200000000, "timestamp" => 27635904, "totalAmount" => 62201466, "totalFee" => 30000000, "totalForged" => "230000000", "version" => 0}, %{"blockSignature" => "3045022100c2258dfa46e4fa8cc2e3440b970841fc9d85c53ede6d2fcf1a08f292a847bb0e02202e0ed9e52b5bbd59480dec7005eb66fdb6fc16ed2715d4a8f433ec908cf3717d", "confirmations" => 9, "generatorId" => "DFcYHfCwhGWcBNy6cp48wy5SfXbQmfBYgT", "generatorPublicKey" => "033f28ad2e9b897d46f1e67c7c52070e9ca46b04c0679ebb21fb236719e38aade3", "height" => 2492230, "id" => "17140593873483060938", "numberOfTransactions" => 2, "payloadHash" => "a7afa696a39f25eaeba96e8b29a787cb42cf61d4b4e917380f7eca57a6370db1", "payloadLength" => 64, "previousBlock" => "2368198394127036240", "reward" => 200000000, "timestamp" => 27635896, "totalAmount" => 66300, "totalFee" => 20000000, "totalForged" => "220000000", "version" => 0}, %{"blockSignature" => "3045022100cac51c3b6a4385b8251335e0fbe8666fd4976229883e4da1626779d595a12454022065ab9ccab76cc63167a5b791b13b9c64b97281c34586d490bc74d2febe6b0887", "confirmations" => 10, "generatorId" => "D9rv3h61heDYHQ3b3Xk3V5epHSTTC6Vn1d", "generatorPublicKey" => "03127001718bee76f14133272f0f4a928ffa8c2b38cafd94d7100253dac732c644", "height" => 2492229, "id" => "2368198394127036240", "numberOfTransactions" => 2, "payloadHash" => "0511c40a65c11fa6cfd65f4b4d6f588c8e4af36a02e7cd0f95d7a0f15788038b", "payloadLength" => 64, "previousBlock" => "2373596679961133421", "reward" => 200000000, "timestamp" => 27635888, "totalAmount" => 33320398, "totalFee" => 20000000, "totalForged" => "220000000", "version" => 0}, %{"blockSignature" => "30450221008db8b1d73b2cd2e45be4c90b33b483799d161fe2b84b40943a25d0d9a79d44a802204f9929021fd58e1cb15c4bbc331fa77443c7ffa1506b50a31b8cf20b4c57174d", "confirmations" => 11, "generatorId" => "DDLbnve6XK48cGsQiFhesUJQRQdKkZTfPh", "generatorPublicKey" => "02af5e6341efc14f4ba39a9ff65e151cc7304fc742ce7b2678d9aa446c555ee9c1", "height" => 2492228, "id" => "2373596679961133421", "numberOfTransactions" => 3, "payloadHash" => "9eb032b67cf7f374b6c22c3b360cadf35300e711aec55e3793f43d047be4d9c8", "payloadLength" => 96, "previousBlock" => "6093475042546912468", "reward" => 200000000, "timestamp" => 27635872, "totalAmount" => 99444, "totalFee" => 30000000, "totalForged" => "230000000", "version" => 0}, %{"blockSignature" => "3045022100ca9f7fdaecca7a577df2c2b40edf65f77477dbee47bdcaa651b36bb4c5ef701802205ed79e414122aaa6ddd171170cd053e8b04587afb7bd8a7c296b9ae206517984", "confirmations" => 12, "generatorId" => "DRkYdhviW7vCoAvYk79vQReFsiZeDeRxa6", "generatorPublicKey" => "02df70fa5cf1687438363c06f97f8e1b67bb565f77ded6988dd46d4456bfdaf4af", "height" => 2492227, "id" => "6093475042546912468", "numberOfTransactions" => 2, "payloadHash" => "cca3c022648c36fd573d1d037a55f0f4ee45a26180b08a9d710d7732eb9729ed", "payloadLength" => 64, "previousBlock" => "9132907835043782993", "reward" => 200000000, "timestamp" => 27635864, "totalAmount" => 53000834, "totalFee" => 20000000, "totalForged" => "220000000", "version" => 0}, %{"blockSignature" => "3044022006f192210da7b19c5efd662fe137035d28b8edb8b3dcc00cb21757822bac83f5022036d7f20b6e1ede6747d81d8f1ad2dc342c8a18fbcf7e32d70304add56973c6fd", "confirmations" => 13, "generatorId" => "DGjvkEHbyxggxPXJEoZwJxQQQcjDxgRwAy", "generatorPublicKey" => "03b688ac6e5de290e4ab06e0d26f24db352334ff1491ea8a7d104f6c5e0753e90e", "height" => 2492226, "id" => "9132907835043782993", "numberOfTransactions" => 0, "payloadHash" => "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", "payloadLength" => 0, "previousBlock" => "6278625533439911608", "reward" => 200000000, "timestamp" => 27635856, "totalAmount" => 0, "totalFee" => 0, "totalForged" => "200000000", "version" => 0}, %{"blockSignature" => "3045022100de46ffd04ac13448b0fe417573d6d314e727d2fb934c4f40dfe35a44e0f7bd8c022049026b187bab286108a38b1f9c014ee6bd267ab5cebe763e91f23c44229d7b30", "confirmations" => 14, "generatorId" => "DB8LnnQqYvHpG4WkGJ9AJWBYEct7G3yRZg", "generatorPublicKey" => "0265c1f6b8c1966a90f3fed7bc32fd4f42238ab4938fdb2a4e7ddd01ae8b58b4c0", "height" => 2492225, "id" => "6278625533439911608", "numberOfTransactions" => 0, "payloadHash" => "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", "payloadLength" => 0, "previousBlock" => "784616842394456791", "reward" => 200000000, "timestamp" => 27635848, "totalAmount" => 0, "totalFee" => 0, "totalForged" => "200000000", "version" => 0}, %{"blockSignature" => "3045022100d275d3664201203f9b4189b7428a2619bb57986e331f087b916800f44e85685d0220591723d5122a244c0c0dc3628f466b100bd3be685cc4b5d5bb9222ac33bb196b", "confirmations" => 15, "generatorId" => "DMSwarrHg5N9ZAZ6nsqPuUjyAU6gdRAM9d", "generatorPublicKey" => "037def83d085778d7767a182a179f345207953441089081f5bc13f86d3891308aa", "height" => 2492224, "id" => "784616842394456791", "numberOfTransactions" => 0, "payloadHash" => "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", "payloadLength" => 0, "previousBlock" => "2090611452819202966", "reward" => 200000000, "timestamp" => 27635840, "totalAmount" => 0, "totalFee" => 0, "totalForged" => "200000000", "version" => 0}, %{"blockSignature" => "304402203197bb80e756ce24c7abf10c74853efb582f0e0427350418a9c3b8f9fb0648ca02205084a816e634ff4fdf6c5f95dd471a77a88bc102672aad4be87913753ac2aaf6", "confirmations" => 16, "generatorId" => "DQPr5WHkhau3Ka2RKb7egm7isr5wbNHbF1", "generatorPublicKey" => "03ce7fbbdd946ec0c720ad37d541e269862be887c23075369955a279e46ab312a9", "height" => 2492223, "id" => "2090611452819202966", "numberOfTransactions" => 0, "payloadHash" => "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", "payloadLength" => 0, "previousBlock" => "9372280161021404602", "reward" => 200000000, "timestamp" => 27635832, "totalAmount" => 0, "totalFee" => 0, "totalForged" => "200000000", "version" => 0}, %{"blockSignature" => "3044022001965fdd16d04a79039513889ac84ddc20a61c296aaf37ae44e16d55575e1e280220116c0c62e90cdc821b2436f4614915ae6e9d26d1c050ad88e9ab34011fbd61bb", "confirmations" => 17, "generatorId" => "D7P41dV7s259L3P7BVPNyqExqNDC7vdfx9", "generatorPublicKey" => "030fa94238eb63db0247a9bd6a3fd810f690b449ee9ce4eb654b94b22875a9a612", "height" => 2492222, "id" => "9372280161021404602", "numberOfTransactions" => 0, "payloadHash" => "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", "payloadLength" => 0, "previousBlock" => "16099002042207360857", "reward" => 200000000, "timestamp" => 27635824, "totalAmount" => 0, "totalFee" => 0, "totalForged" => "200000000", "version" => 0}, %{"blockSignature" => "3045022100ac303eb10d353e17a0a982dc4b823910323f7e8d8174a2bbda9467307969e465022071752781448a2d04ce9796cb72582921f019173b5f4d2177d00efd3f6361536e", "confirmations" => 18, "generatorId" => "D5e2FzTPqdEHridjzpFZCCVyepAu6Vpmk4", "generatorPublicKey" => "023e577a7b3362e0aba70e6911d230e86d729b4cb640f0e0b25637b812a3e38b53", "height" => 2492221, "id" => "16099002042207360857", "numberOfTransactions" => 0, "payloadHash" => "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", "payloadLength" => 0, "previousBlock" => "3386679294157987114", "reward" => 200000000, "timestamp" => 27635816, "totalAmount" => 0, "totalFee" => 0, "totalForged" => "200000000", "version" => 0}, %{"blockSignature" => "30440220650126c0d3fa7a0f73ca0e7f2d488b826baeae1bf54d7b8f81837c2b23a8c8c302200bfd352ddfccb6312288ce56450400062cd2cb0b8cc68554cfd81191e6b80a0b", "confirmations" => 19, "generatorId" => "DARiJqhogp2Lu6bxufUFQQMuMyZbxjCydN", "generatorPublicKey" => "022cca9529ec97a772156c152a00aad155ee6708243e65c9d211a589cb5d43234d", "height" => 2492220, "id" => "3386679294157987114", "numberOfTransactions" => 0, "payloadHash" => "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", "payloadLength" => 0, "previousBlock" => "12193259313905900025", "reward" => 200000000, "timestamp" => 27635792, "totalAmount" => 0, "totalFee" => 0, "totalForged" => "200000000", "version" => 0}, %{"blockSignature" => "3045022100d552f4479df6612953c2fd7d1db59035ccf029d0ace12450e5f1dd4e3e46f4c00220427a1b093ccfb97312f59d0d733907e8419aa528ea89532e9e4b684eef0800ce", "confirmations" => 20, "generatorId" => "DJ1J2NiRm8ZzhzXMBxi7sft8DVksLVjY6j", "generatorPublicKey" => "0255ba820d684e5f5f3cff31da03cb95e2d2aebd9b8609df8d16f17853c5ecb6a2", "height" => 2492219, "id" => "12193259313905900025", "numberOfTransactions" => 0, "payloadHash" => "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", "payloadLength" => 0, "previousBlock" => "5522292045493509531", "reward" => 200000000, "timestamp" => 27635776, "totalAmount" => 0, "totalFee" => 0, "totalForged" => "200000000", "version" => 0}, %{"blockSignature" => "304402203c99bb81aab920cf88337ba5a6428bc52e7ed78f775277e89ec5890ad14e9b41022069f0e6a2222283b4cb044fd508b31b64f06c5b85e727b7e2915ae9cb3390c1d5", "confirmations" => 21, "generatorId" => "DHQ4Fjsyiop3qBR4otAjAu6cBHkgRELqGA", "generatorPublicKey" => "0275776018638e5c40f1b922901e96cac2caa734585ef302b4a2801ee9a338a456", "height" => 2492218, "id" => "5522292045493509531", "numberOfTransactions" => 0, "payloadHash" => "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", "payloadLength" => 0, "previousBlock" => "9829382645155106591", "reward" => 200000000, "timestamp" => 27635768, "totalAmount" => 0, "totalFee" => 0, "totalForged" => "200000000", "version" => 0}, %{"blockSignature" => "3045022100b9d3b6b53a59683ef3e2beb9f5b4a02c3a3869502b9c405adf3e8686c4974a5a022033f636303d112dc1f580a1e7fd8f58b86c0f00c58a985f55ca2513c161ef05c0", "confirmations" => 22, "generatorId" => "D8vCDNbhPk3gPtWowcnQASLWhzzZMeg6X8", "generatorPublicKey" => "0326580718fc86ba609799ac95fcd2721af259beb5afa81bfce0ab7d9fe95de991", "height" => 2492217, "id" => "9829382645155106591", "numberOfTransactions" => 0, "payloadHash" => "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", "payloadLength" => 0, "previousBlock" => "7051623308537203293", "reward" => 200000000, "timestamp" => 27635760, "totalAmount" => 0, "totalFee" => 0, "totalForged" => "200000000", "version" => 0}, %{"blockSignature" => "3045022100e1edc9ba230504cf0cb0894af8573eff693bef50c38e8e1ea9afcf8c8d3f82c502205f264463c3dbd6be11da8c0b00419e7135968e229f1b06761b851dce2d9e2a7b", "confirmations" => 23, "generatorId" => "DTxxPEyZQDGCfCAsAQdvtkgjiXo6guHQaG", "generatorPublicKey" => "031c3a1f0d42e9a0fbbd55fd4299f3d39c78f6e426e4f6f8a9e1d859d0de674711", "height" => 2492216, "id" => "7051623308537203293", "numberOfTransactions" => 0, "payloadHash" => "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", "payloadLength" => 0, "previousBlock" => "17818404880943646096", "reward" => 200000000, "timestamp" => 27635744, "totalAmount" => 0, "totalFee" => 0, "totalForged" => "200000000", "version" => 0}, %{"blockSignature" => "3045022100953d616721267f614ad46cbf1ec5e2b37dc1da4ea95fc6aaa1b02a619365656102202de9f91fdc7dd116460145fcdf363ee3b281ddc81820c67e1d096bd997add575", "confirmations" => 24, "generatorId" => "DU5SfeCnoHV9n11cWe3YDWuf6BCyy4uwEk", "generatorPublicKey" => "024856c98b2ec1944c5dde44a3a551b394f47f2176c39d9351cc492d1ec323211e", "height" => 2492215, "id" => "17818404880943646096", "numberOfTransactions" => 0, "payloadHash" => "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", "payloadLength" => 0, "previousBlock" => "12611041278673872569", "reward" => 200000000, "timestamp" => 27635736, "totalAmount" => 0, "totalFee" => 0, "totalForged" => "200000000", "version" => 0}, %{"blockSignature" => "3045022100d95b79416c2a3dad03fcb8e027d69689de6860dcbc484980b4bd8e3cc4d8b91a0220578cc281f6ef18518bc44f93aa2f5a37482af8396d6ee88b0ffe7142a8de72fd", "confirmations" => 25, "generatorId" => "DNL81CT6WNG1PHjobBmLvKwLV3UUscBymB", "generatorPublicKey" => "03e5b39a83e6c7c952c5908089d4524bb8dda93acc2b2b953247e43dc4fe9aa3d1", "height" => 2492214, "id" => "12611041278673872569", "numberOfTransactions" => 0, "payloadHash" => "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", "payloadLength" => 0, "previousBlock" => "9154801427443107748", "reward" => 200000000, "timestamp" => 27635728, "totalAmount" => 0, "totalFee" => 0, "totalForged" => "200000000", "version" => 0}, %{"blockSignature" => "304402205188ac24de75a7ee35eafe6bd0433aee298ae696fb5130b0094916c52fe5625e02203a2dae3078f8ada4c4a7a59f03925d55613f3b65832dfbdb926fb2c46cb79ac2", "confirmations" => 26, "generatorId" => "DB8LnnQqYvHpG4WkGJ9AJWBYEct7G3yRZg", "generatorPublicKey" => "0265c1f6b8c1966a90f3fed7bc32fd4f42238ab4938fdb2a4e7ddd01ae8b58b4c0", "height" => 2492213, "id" => "9154801427443107748", "numberOfTransactions" => 0, "payloadHash" => "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", "payloadLength" => 0, "previousBlock" => "12680690845067045816", "reward" => 200000000, "timestamp" => 27635720, "totalAmount" => 0, "totalFee" => 0, "totalForged" => "200000000", "version" => 0}, %{"blockSignature" => "3045022100bc1736e4f5a8c025b8c2b0e32e995aadd00124920d90f92e277f9f1e2470ad5e02202be3f553ef478848bca50f87285135462bd83f3998175566bb17ed721ef4c848", "confirmations" => 27, "generatorId" => "DAZA9otpg7J3pAe9F2TukUa1hjCQnArMk8", "generatorPublicKey" => "03c638259e874e38bb9621f29a907c3e2445b5bd61c76c3c3098bff83ebabbfeab", "height" => 2492212, "id" => "12680690845067045816", "numberOfTransactions" => 0, "payloadHash" => "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", "payloadLength" => 0, "previousBlock" => "13450275610017547521", "reward" => 200000000, "timestamp" => 27635704, "totalAmount" => 0, "totalFee" => 0, "totalForged" => "200000000", "version" => 0}, %{"blockSignature" => "3045022100c3b971fcdd25cfdf8ec967abef38e08cc698c196b8d642a488887d3b948aa40b0220609a6d4a25709329e477caceffb9d0e925322ac84f34c6ea282e4b4ccdeb07e5", "confirmations" => 28, "generatorId" => "DR23FuR1M9GPaknEFSP6QCbsaHnTMdgkFu", "generatorPublicKey" => "031e195f2ba9afcfbea54866b0dac663f568620fb098fdea239f87b4e36c282e44", "height" => 2492211, "id" => "13450275610017547521", "numberOfTransactions" => 0, "payloadHash" => "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", "payloadLength" => 0, "previousBlock" => "10006100215952048498", "reward" => 200000000, "timestamp" => 27635696, "totalAmount" => 0, "totalFee" => 0, "totalForged" => "200000000", "version" => 0}, %{"blockSignature" => "304502210087fa28c50fc13de2844f65af8b9fa4645cfec48a59b3bc99a76e0a9e43ad8561022049fba5fd6cec6316a5850d63f3507f76be1609189d45fdc847a6bd674f6697c1", "confirmations" => 29, "generatorId" => "DHQ4Fjsyiop3qBR4otAjAu6cBHkgRELqGA", "generatorPublicKey" => "0275776018638e5c40f1b922901e96cac2caa734585ef302b4a2801ee9a338a456", "height" => 2492210, "id" => "10006100215952048498", "numberOfTransactions" => 0, "payloadHash" => "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", "payloadLength" => 0, "previousBlock" => "1422208301817463362", "reward" => 200000000, "timestamp" => 27635688, "totalAmount" => 0, "totalFee" => 0, "totalForged" => "200000000", "version" => 0}, %{"blockSignature" => "3045022100a9aa3debc7811d220258d4e294a14227bd1b5c63d5b91c1101988cb8420f46d202201c20c937bb49c86e0bc38c5c745e44aa741f11a1cbc566869dcd3af44766f504", "confirmations" => 30, "generatorId" => "DDAHPjVTTV3uur653TB27fcLGh7XXWnvxW", "generatorPublicKey" => "02845161cfca4d6ddde8e0d53538b6f881fb3ad9383cd77cebc55375dd6fd17663", "height" => 2492209, "id" => "1422208301817463362", "numberOfTransactions" => 0, "payloadHash" => "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", "payloadLength" => 0, "previousBlock" => "9760029593096360033", "reward" => 200000000, "timestamp" => 27635680, "totalAmount" => 0, "totalFee" => 0, "totalForged" => "200000000", "version" => 0}, %{"blockSignature" => "304402205b2f604873931e783a4d715881454c165724f571518b66a246a19e626de1a56f02204c291240f8b0cff76eea5dbd4c45e090810d69e10db9345bc7c464980288f124", "confirmations" => 31, "generatorId" => "DFyLKkWs12QwDTi8BywQN5ssa5CMK3dr6d", "generatorPublicKey" => "02cd9f56a176c843724eb58d3ef89dc88915a814bdcf284b02933e0dd203630a83", "height" => 2492208, "id" => "9760029593096360033", "numberOfTransactions" => 0, "payloadHash" => "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", "payloadLength" => 0, "previousBlock" => "3345302360889825716", "reward" => 200000000, "timestamp" => 27635672, "totalAmount" => 0, "totalFee" => 0, "totalForged" => "200000000", "version" => 0}, %{"blockSignature" => "3044022019809c46668e78e5fb84e68c91440cb26ba9a2eb952aba64f829a8c1df4ae4cb0220618103b332853275309f94669b4c6cd96357caa84ff2dffaa98d859531518528", "confirmations" => 32, "generatorId" => "DDLbnve6XK48cGsQiFhesUJQRQdKkZTfPh", "generatorPublicKey" => "02af5e6341efc14f4ba39a9ff65e151cc7304fc742ce7b2678d9aa446c555ee9c1", "height" => 2492207, "id" => "3345302360889825716", "numberOfTransactions" => 0, "payloadHash" => "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", "payloadLength" => 0, "previousBlock" => "18059946241516158595", "reward" => 200000000, "timestamp" => 27635664, "totalAmount" => 0, "totalFee" => 0, "totalForged" => "200000000", "version" => 0}, %{"blockSignature" => "304502210099a0837dcc5c3d3aa5ef35630cc3813316a4b155731b751446fc48e1e77f9f9d02204829492da05655e8946009d37c5869ab5122686efb96df04ae1817e20c3f9077", "confirmations" => 33, "generatorId" => "DTT7ik3yqnzLBVJm5iqG6Ayijtn6M4Pqr6", "generatorPublicKey" => "03cbefd8c4286568665c7252197293ba258852b2c511d4f0aaa16d8d5e53b7971d", "height" => 2492206, "id" => "18059946241516158595", "numberOfTransactions" => 0, "payloadHash" => "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", "payloadLength" => 0, "previousBlock" => "2321358789951651085", "reward" => 200000000, "timestamp" => 27635648, "totalAmount" => 0, "totalFee" => 0, "totalForged" => "200000000", "version" => 0}, %{"blockSignature" => "30450221008ce3ec762c10bb4fc28e9d0ad2f3469393e8950894128fdb75f5f1a630934d7c022048b7523e75728fa2c021c60659358589abd9c4093f00e428c05053459e98cc6c", "confirmations" => 34, "generatorId" => "D9K4pTDqHF4r8NNabfD54GEvAxsVL729Lx", "generatorPublicKey" => "028f0a25321cd9d3bf051b34a835cd5eee0125120c17654bc95790f8f2d970dc46", "height" => 2492205, "id" => "2321358789951651085", "numberOfTransactions" => 0, "payloadHash" => "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", "payloadLength" => 0, "previousBlock" => "3649942244648776809", "reward" => 200000000, "timestamp" => 27635640, "totalAmount" => 0, "totalFee" => 0, "totalForged" => "200000000", ...}, %{"blockSignature" => "3045022100c91f9841db49eea767d2d61ff9c2aa419039a479105f2943dd6c36c1b88f104f02207338d87affb5d14e25cd0bc0d5d90c6ede30b573c58c41a5cf44a6b7822d1e0e", "confirmations" => 35, "generatorId" => "DMSwarrHg5N9ZAZ6nsqPuUjyAU6gdRAM9d", "generatorPublicKey" => "037def83d085778d7767a182a179f345207953441089081f5bc13f86d3891308aa", "height" => 2492204, "id" => "3649942244648776809", "numberOfTransactions" => 0, "payloadHash" => "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", "payloadLength" => 0, "previousBlock" => "11413780211431609943", "reward" => 200000000, "timestamp" => 27635608, "totalAmount" => 0, "totalFee" => 0, ...}, %{"blockSignature" => "3045022100e5da54517faaccf806060e312b8842ad3508d957a0394b113a6cbf2d9cf16b8a02206466229ca7c7abf71d660ecd3aab6a15330cac633872ea4be5c70021419340cc", "confirmations" => 36, "generatorId" => "D9DyZoqNggbnGp9dMtpKwsBDpsYxGQy66D", "generatorPublicKey" => "02dc13fcb190bcfbe9e7ecfc6269635ed2c497a75bab471f2b15c1a99897da97b3", "height" => 2492203, "id" => "11413780211431609943", "numberOfTransactions" => 0, "payloadHash" => "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", "payloadLength" => 0, "previousBlock" => "262814513033870515", "reward" => 200000000, "timestamp" => 27635592, "totalAmount" => 0, ...}, %{"blockSignature" => "3045022100b536806c47fe252a8dc6eb33caf13fee7e758f147f665b93131fe97d1bbb2eff022030714910eba8c100f17aa8630d3cfcef6a83dfd863653ec2658fb21dcacd6dd4", "confirmations" => 37, "generatorId" => "DN1F1LhDgmPqvr6UhMjxU7G7ud6uZ6SrNd", "generatorPublicKey" => "0200af8a7a8572bcb3fcd305248343358198c8ed5bd004bbacfb16e7f0b09e532b", "height" => 2492202, "id" => "262814513033870515", "numberOfTransactions" => 0, "payloadHash" => "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", "payloadLength" => 0, "previousBlock" => "15624760404362606996", "reward" => 200000000, "timestamp" => 27635584, ...}, %{"blockSignature" => "304402202a4218cbd4c44f1badc1a625fb9a85e2a5b211c7f70f83b278d8c48a37f3da6802203e927c2b4c3707c11a7b67c4077ea7cb26b170c1cba1de55af20bee8ff2b54b0", "confirmations" => 38, "generatorId" => "DBi2HdDY8TqMCD2aFLVomEF92gzeDmEHmR", "generatorPublicKey" => "03bd4f16e39aaba5cba6a87b7498b08ce540f279be367e68ae96fb05dfabe203ad", "height" => 2492201, "id" => "15624760404362606996", "numberOfTransactions" => 0, "payloadHash" => "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", "payloadLength" => 0, "previousBlock" => "9250684788790030662", "reward" => 200000000, ...}, %{"blockSignature" => "3045022100ae2bfaa6156649beee34a71f5b5678f52361592e0194b0ab15ce807e5742b3550220173974d818f3df25f07cb2ac6a9e37393fd84929e93895af926e7f96c3a7e878", "confirmations" => 39, "generatorId" => "DJ1J2NiRm8ZzhzXMBxi7sft8DVksLVjY6j", "generatorPublicKey" => "0255ba820d684e5f5f3cff31da03cb95e2d2aebd9b8609df8d16f17853c5ecb6a2", "height" => 2492200, "id" => "9250684788790030662", "numberOfTransactions" => 0, "payloadHash" => "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", "payloadLength" => 0, "previousBlock" => "10657104097780036041", ...}, %{"blockSignature" => "3044022006e2c38b087a93c71bbec9d56551f696d6f9a157abc691dacba46b52a1a577060220083fcc619cdb55484a898cb2a70941a3ebc7ec67a6e0cc9fcfeac6842a232ae0", "confirmations" => 40, "generatorId" => "D5e2FzTPqdEHridjzpFZCCVyepAu6Vpmk4", "generatorPublicKey" => "023e577a7b3362e0aba70e6911d230e86d729b4cb640f0e0b25637b812a3e38b53", "height" => 2492199, "id" => "10657104097780036041", "numberOfTransactions" => 0, "payloadHash" => "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", "payloadLength" => 0, ...}, %{"blockSignature" => "30440220448d53f5d8dfbc56d5ead2d9b6a12601c5e6b43a9212feedea67ea71306e4fa302202f3cce769be289ec367e05cfdc94d0d85371ef35603d8d2053187bde32c9c891", "confirmations" => 41, "generatorId" => "DGjvkEHbyxggxPXJEoZwJxQQQcjDxgRwAy", "generatorPublicKey" => "03b688ac6e5de290e4ab06e0d26f24db352334ff1491ea8a7d104f6c5e0753e90e", "height" => 2492198, "id" => "7412638006895457051", "numberOfTransactions" => 0, "payloadHash" => "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", ...}, %{"blockSignature" => "3044022055cb35ce731fe6c126abc926c16c6d30d7b8e5d878509b949bdba3cef40d84b902204cef5b76f16c7c00fe17d5a61439ebdcfa1ccbb0e74e88b5a3d0025bcec59769", "confirmations" => 42, "generatorId" => "DL7Y6smfHHs3Ms3hAYmSYYd5PZukmtDY1i", "generatorPublicKey" => "03efd265a086c2a099cda4f4fd202adbac07567e1229ce5e6fe39963b714c1e2d5", "height" => 2492197, "id" => "14490703941743157405", "numberOfTransactions" => 0, ...}, %{"blockSignature" => "3045022100fe6f9d83fa34539ee60c5203c3d7fdcdc7bb37b9ccc16c9c8d7227e15246e2ab02204af498ab8be13c1947f153ab411f4a7851860067c40f9174cb728f4658f40316", "confirmations" => 43, "generatorId" => "DJmr887qE9pZ374tAEnzcnR3hZqGJ5DYwM", "generatorPublicKey" => "03ea30ad4c2c5906061b09fac51a6f4b7765e59091ddd101af28d1ec901d42b41f", "height" => 2492196, "id" => "5551468797887612400", ...}, %{"blockSignature" => "3045022100b747d332707bd1bb2996727d10ef5d49d408302370c6271998ddc8563e3bb8770220195dfaba89e22a6caf972a1ba83518c8c70d8685d488f35485c8981e81d7eae1", "confirmations" => 44, "generatorId" => "DH4Zy9TTHtiHYvzaomk2PJR13tzsmneQSo", "generatorPublicKey" => "020f5df4d2bc736d12ce43af5b1663885a893fade7ee5e62b3cc59315a63e6a325", "height" => 2492195, ...}, %{"blockSignature" => "304402200fbcb2dcc2b369976eb67f58189bb325dec897d1c07bc786d5eca791007dc0020220301d6e8067f076fde55748b18a89f8c9d7b242e1a6cc164f2fceebb8c9e4065c", "confirmations" => 45, "generatorId" => "D7K3KFBESSwPqEYDBdgY5XLRUKZuxNKtun", "generatorPublicKey" => "02b7b740973db16cd9c6f0f6f2bc160d27cd2a855e172d887833141bec234eb80c", ...}, %{"blockSignature" => "3045022100a6f9b6f4ce800e627fd72e54791e5c09232bc132dd2544a2b174de66e13d2ca4022073436a29b9e2bfe56cb4dec3aad2dac9b06ffff1b7ecbbb6624486c296816eb6", "confirmations" => 46, "generatorId" => "DFHdEBuVCz5zfj8yeo3BmKEdsEKpMaYRRw", ...}, %{"blockSignature" => "3045022100839827b400d5cf6d56fda58fd0e188f0e49d57a5777101658b300822f8d582260220103546fdd5578dc460ef1ccbefd473b3b42caec57917901e1877e6b61b15ca36", "confirmations" => 47, ...}, %{"blockSignature" => "3045022100ff08ade1585783f89af141c76958588f17521f69cc8b3b77f489a7eb16dca93002204a008064922757653ae64d27b051c3566f8eacfafa7f41d72083b00e268c6c89", ...}, %{...}, ...], "success" => true}

  """
  @spec blocks(Tesla.Client.t(), Keyword.t()) :: ArkElixir.response()
  def blocks(client, parameters \\ []) do
    client
    |> get("api/blocks", query: parameters)
    |> handle_response
  end

  @doc """
  Get the blockchain epoch.

  ## Examples

      iex> ArkElixir.Block.epoch(client)
      %{"epoch" => "2017-03-21T13:00:00.000Z", "success" => true}

  """
  @spec epoch(Tesla.Client.t()) :: ArkElixir.response()
  def epoch(client) do
    get(client, "api/blocks/getEpoch")
  end

  @doc """
  Get the transaction fee for sending "normal" transactions.

  ## Examples

      iex> ArkElixir.Block.fee(client)
      %{"fee" => 10000000, "success" => true}

  """
  @spec fee(Tesla.Client.t()) :: ArkElixir.response()
  def fee(client) do
    get(client, "api/blocks/getFee")
  end

  @doc """
  Get the network fees.

  ## Examples

      iex> ArkElixir.Block.fees(client)
      %{"fees" => %{"delegate" => 2500000000, "multisignature" => 500000000, "secondsignature" => 500000000, "send" => 10000000, "vote" => 100000000}, "success" => true}

  """
  @spec fees(Tesla.Client.t()) :: ArkElixir.response()
  def fees(client) do
    get(client, "api/blocks/getFees")
  end

  @doc """
  Get the blockchain height.

  ## Examples

      iex> ArkElixir.Block.height(client)
      %{"height" => 2492238, "id" => "5588520656518800754", "success" => true

  """
  @spec height(Tesla.Client.t()) :: ArkElixir.response()
  def height(client) do
    get(client, "api/blocks/getHeight")
  end

  @doc """
  Get the blockchain milestone.

  ## Examples

      iex> ArkElixir.Block.milestone(client)
      %{"milestone" => 0, "success" => true}

  """
  @spec milestone(Tesla.Client.t()) :: ArkElixir.response()
  def milestone(client) do
    get(client, "api/blocks/getMilestone")
  end

  @doc """
  Get the blockchain nethash.

  ## Examples

      iex> ArkElixir.Block.nethash(client)
      %{"nethash" => "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23", "success" => true}

  """
  @spec nethash(Tesla.Client) :: ArkElixir.response()
  def nethash(client) do
    get(client, "api/blocks/getNethash")
  end

  @doc """
  Get the blockchain reward.

  ## Examples

      iex> ArkElixir.Block.reward(client)
      %{"reward" => 200000000, "success" => true}

  """
  @spec reward(Tesla.Client.t()) :: ArkElixir.response()
  def reward(client) do
    get(client, "api/blocks/getReward")
  end

  @doc """
  Get the blockchain status.

  ## Examples

      iex> ArkElixir.Block.status(client)
      %{"epoch" => "2017-03-21T13:00:00.000Z", "fee" => 10000000, "height" => 2492238, "milestone" => 0, "nethash" => "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23", "reward" => 200000000, "success" => true, "supply" => 12998447600000000}

  """
  @spec status(Tesla.Client.t()) :: ArkElixir.response()
  def status(client) do
    get(client, "api/blocks/getStatus")
  end

  @doc """
  Get the blockchain supply.

  ## Examples

      iex> ArkElixir.Block.supply(client)
      %{"success" => true, "supply" => 12998447600000000}

  """
  @spec supply(Tesla.Client.t()) :: ArkElixir.response()
  def supply(client) do
    get(client, "api/blocks/getSupply")
  end

  # private

  defp handle_response({:ok, %{"blocks" => blocks}}) do
    {:ok, Enum.map(blocks, &Block.build/1)}
  end

  defp handle_response({:ok, invalid_response}) do
    {:error, invalid_response}
  end

  defp handle_response({:error, _error} = response) do
    response
  end
end
