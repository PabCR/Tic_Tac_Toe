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

    assert Board.edit_board(board, 0, 0, "X") ==
             {:ok,
              [
                ["X", "-", "-"],
                ["-", "-", "-"],
                ["-", "-", "-"]
              ]}
  end

  test "Does not edit board when space already taken" do
    board = Board.create_board()
    {_, board} = Board.edit_board(board, 0, 0, "X")
    assert Board.edit_board(board, 0, 0, "O") == {:error, "Invalid Position"}
  end

  test "Checks for conflict in coordinates" do
    board = Board.create_board()
    {_, board} = Board.edit_board(board, 0, 0, "X")

    assert board == [
             ["X", "-", "-"],
             ["-", "-", "-"],
             ["-", "-", "-"]
           ]

    # assert Board.edit_board(board, 0, 0, "O") == {:error, "Invalid Position"}
  end
  test "Checks for win" do
    board = [
      ["X", "X", "X"],
      ["O", "X", "O"],
      ["O", "X", "O"]
    ]

    assert Board.check_win(board) == true
  end
  test "Checks for no win" do
    board = [
      ["X", "O", "X"],
      ["O", "X", "O"],
      ["O", "X", "-"]
    ]

    assert Board.check_win(board) == false
  end
end
