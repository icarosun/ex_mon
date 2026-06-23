defmodule ExMon.GameTest do
  use ExUnit.Case

  alias ExMon.{Game, Player}

  describe "start/2" do
    test "started the game state" do
      player = Player.build("Teste", :chute, :cura, :soco)
      computer = Player.build("Robotinik", :chute, :cura, :soco)

      assert {:ok, _pid} = Game.start(computer, player)
    end
  end

  describe "info/0" do
    test "returns the current game state" do
      player = Player.build("Teste", :chute, :cura, :soco)
      computer = Player.build("Robotinik", :chute, :cura, :soco)

      Game.start(computer, player)

      expected_response = %{
        status: :started,
        player: %Player{
          name: "Teste",
          moves: %{
            move_avg: :chute,
            move_rnd: :soco,
            move_heal: :cura
          },
          life: 100
        },
        computer: %Player{
          name: "Robotinik",
          moves: %{
            move_avg: :chute,
            move_rnd: :soco,
            move_heal: :cura
          },
          life: 100
        },
        turn: :player
      }

      assert expected_response == Game.info()
    end
  end

  describe "update/1" do
    test "returns the game state updated" do
      player = Player.build("Teste", :chute, :cura, :soco)
      computer = Player.build("Robotinik", :chute, :cura, :soco)

      Game.start(computer, player)

      expected_response = %{
        status: :started,
        player: %Player{
          name: "Teste",
          moves: %{
            move_avg: :chute,
            move_rnd: :soco,
            move_heal: :cura
          },
          life: 100
        },
        computer: %Player{
          name: "Robotinik",
          moves: %{
            move_avg: :chute,
            move_rnd: :soco,
            move_heal: :cura
          },
          life: 100
        },
        turn: :player
      }

      assert expected_response == Game.info()

      new_state = %{
        status: :started,
        player: %Player{
          name: "Teste",
          moves: %{
            move_avg: :chute,
            move_rnd: :soco,
            move_heal: :cura
          },
          life: 85
        },
        computer: %Player{
          name: "Robotinik",
          moves: %{
            move_avg: :chute,
            move_rnd: :soco,
            move_heal: :cura
          },
          life: 50
        },
        turn: :player
      }

      Game.update(new_state)

      expected_response = %{new_state | turn: :computer, status: :continue}

      assert expected_response == Game.info()
    end
  end
end
