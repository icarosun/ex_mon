defmodule ExMonTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  alias ExMon.Player

  describe "create_player/4" do
    test "returns a player" do
      expected_response = %Player{
        name: "Teste",
        moves: %{
          move_avg: :chute,
          move_rnd: :soco,
          move_heal: :cura
        },
        life: 100
      }

      assert expected_response == ExMon.create_player("Teste", :chute, :cura, :soco)
    end
  end

  describe "start_game/1" do
    test "when the game is started, returns a message" do
      player = Player.build("Teste", :chute, :cura, :soco)

      messages =
        capture_io(fn ->
          assert ExMon.start_game(player) == :ok
        end)

      assert messages =~ "The game is started"
      assert messages =~ "status: :started"
      assert messages =~ "turn: :player"
    end
  end
end
