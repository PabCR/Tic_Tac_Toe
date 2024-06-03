defmodule TicTacToeTest do
  use ExUnit.Case
  alias TicTacToe
  alias Board

  doctest TicTacToe
  doctest Board

  test "creates empty board" do
    assert Board.create_board() == [
      [" ", " ", " "],
      [" ", " ", " "],
      [" ", " ", " "]
    ]
  end
end
