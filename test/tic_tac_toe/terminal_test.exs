defmodule TerminalTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  alias TicTacToe.Board
  alias TicTacToe.Terminal

  test "prints welcome message" do
    board = Board.create_board()

    assert capture_io(fn -> Terminal.game_welcome(board, "Player 1", "Player 2") end) ==
             "Welcome to Tic Tac Toe\nPlayer 1: Player 1 plays X\nPlayer 2: Player 2 plays O\n- | - | -\n- | - | -\n- | - | -\n"
  end

  test "turns board to string" do
    board = Board.create_board()

    assert capture_io(fn -> IO.puts(Terminal.board_string(board)) end) ==
             "- | - | -\n- | - | -\n- | - | -\n"
  end

  test "prints board" do
    board = Board.create_board()

    assert capture_io(fn -> Terminal.print_board(board) end) ==
             "- | - | -\n- | - | -\n- | - | -\n"
  end

  test "prints winner" do
    assert capture_io(fn -> Terminal.winner("X", "Player 1", "Player 2") end) ==
             "------------------------------\nPlayer Player 2 wins\nGame Over\n"
  end

  test "prints tie" do
    assert capture_io(fn -> Terminal.tie() end) == "It's a tie\nGame Over\n"
  end

  # test "prompts move" do
  #   board = Board.create_board()
  #   assert capture_io(fn ->Terminal.prompt_move(board, "Player 1", "Player 2", "X") end) == [0, 0]
  # end
end
