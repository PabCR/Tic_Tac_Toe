defmodule TicTacToeTest do
  use ExUnit.Case
  doctest TicTacToe

  test "creates empty board" do
    assert Board.create_board() == [
      [" ", " ", " "],
      [" ", " ", " "],
      [" ", " ", " "]
    ]
  end
end
