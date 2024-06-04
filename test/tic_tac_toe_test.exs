defmodule TicTacToeTest do
  use ExUnit.Case
  alias TicTacToe
  alias TicTacToe.Board

  doctest TicTacToe

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

  test "Edits board when empty space" do
    board = Board.create_board()

    assert Board.edit_board(board, 0, 0, "X") == [
             ["X", "-", "-"],
             ["-", "-", "-"],
             ["-", "-", "-"]
           ]
  end
  test "Does not edit board when space already taken" do
    board = Board.create_board()
    board = Board.edit_board(board, 0, 0, "X")
    assert Board.edit_board(board, 0, 0, "O") == {:error, "Invalid Position"}
  end
end
