# ExMon

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ex_mon` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_mon, "~> 0.1.0"}
  ]
end
```

### To started the game

In terminal use:

```bash
iex -S mix
```

Create the player
```elixir
player = ExMon.create_player("Teste", :chute, :soco, :cura)
```
Started the game
```elixir
ExMon.start_game(player)
```
Make a move
```elixir
ExMon.make_move(:chute) # :soco, :cura
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/ex_mon>.

