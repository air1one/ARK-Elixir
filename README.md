# ARK Elixir

<p align="center">
    <img src="https://github.com/faustbrian/ARK-Elixir/blob/master/banner.png" />
</p>

> A [Elixir](https://elixir-lang.org/) bridge for ARK.

## Installation

The package can be installed by adding `ark_elixir` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ark_elixir, github: 'faustbrian/ARK-Elixir'}
  ]
end
```

## Usage

```elixir
client = ArkElixir.Client.new(%{
    protocol: "https",
    ip: "127.0.01",
    port: 4002,
    nethash: "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23",
    version: "1.1.1",
    arkjs: "/usr/local/lib/node_modules/arkjs"
})

response = ArkElixir.Transaction.create(
    client, 'recipientId', 'amount', 'vendorField', 'secret', 'secondSecret'
)

IO.puts response["transactionIds"]
```

# To-Do

- Add Types
- Add Specs
- Add Docs

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
