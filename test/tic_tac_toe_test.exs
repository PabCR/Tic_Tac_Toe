defmodule TicTacToeTest do
  use ExUnit.Case
  alias TicTacToe
  alias Board

  doctest TicTacToe
  doctest Board

  test "creates empty board" do
    assert Board.create_board() == [
      ["-", "-", "-"],
      ["-", "-", "-"],
      ["-", "-", "-"]
    ]
  end
  test "Turns board to string" do
    board = Board.create_board()
    assert Board.board_string(board) == "- | - | -\n- | - | -\n- | - | -"
  end
end
