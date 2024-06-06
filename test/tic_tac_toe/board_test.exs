defmodule BoardTest do
  use ExUnit.Case
  alias TicTacToe.Board

  test "creates empty board" do
    assert Board.create_board() == [
             ["-", "-", "-"],
             ["-", "-", "-"],
             ["-", "-", "-"]
           ]
  end

  test "properly identifies winning board" do
    board = [
      ["X", "X", "X"],
      ["O", "X", "O"],
      ["O", "X", "O"]
    ]

    assert Board.check_win(board) == true
  end

  test "properly identifies non-winning board" do
    board = [
      ["X", "O", "X"],
      ["O", "X", "X"],
      ["O", "X", "O"]
    ]

    assert Board.check_win(board) == false
  end

  test "edit board in correct place" do
    board = Board.create_board()

    assert Board.edit_board(board, 0, 0, "X") ==
             [
               ["X", "-", "-"],
               ["-", "-", "-"],
               ["-", "-", "-"]
             ]
  end
end
