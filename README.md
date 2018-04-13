# ARK Elixir

<p align="center">
    <img src="https://github.com/faustbrian/ARK-Elixir/blob/master/banner.png" />
</p>

> An [ARK](https://github.com/ArkEcosystem/ark-node) bridge for Elixir.

## Installation

The package can be installed by adding `ark_elixir` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ark_elixir, github: "faustbrian/ARK-Elixir"}
  ]
end
```

## Usage

```elixir
client = ArkElixir.Client.new(%{
  protocol: "https",
  ip: "127.0.0.1",
  port: 4002,
  nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
  version: "1.1.1"
})

# or

client = ArkElixir.Client.new(%{
  url: "https://127.0.0.1:4002",
  nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
  version: "1.1.1",
  network_address: ArkElixir.Client.mainnet_network_address
})

{:ok, response} = ArkElixir.Transaction.create(
  client,
  ArkElixir.Client.mainnet_network_address,
  "recipientId",
  "amount",
  "vendorField",
  "secret",
  "secondSecret"
)

IO.puts response["transactionIds"]
```

# To-Do

- Add Responses to Docs

## Testing

``` bash
$ mix test
```

## Security

If you discover a security vulnerability within this package, please send an e-mail to hello@brianfaust.me. All security vulnerabilities will be promptly addressed.

## Credits

- [Brian Faust](https://github.com/faustbrian)
- [All Contributors](../../contributors)

## License

[MIT](LICENSE) © [Brian Faust](https://brianfaust.me)
