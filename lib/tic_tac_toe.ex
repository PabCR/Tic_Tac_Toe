defmodule TicTacToe do
  @moduledoc """
  Documentation for `TicTacToe`.
  """
  def play(p1 \\ "P1", p2 \\ "P2") do
    board = TicTacToe.Board.create_board()
    IO.puts("Welcome #{p1} and #{p2} \n #{TicTacToe.Board.board_string(board)}")
    IO.puts("Player 1: #{p1} plays X and Player 2: #{p2} plays O")
    play_game(board, p1, p2, 0)
  end

  def play_game(board, p1, p2, counter) do
    case counter do
      9 ->
        IO.puts("Game Over")

      _ ->
        IO.puts("Player 1: #{p1} plays X")
        board = get_valid_move(board, "X")
        IO.puts(TicTacToe.Board.board_string(board))
        IO.puts("Player 2: #{p2} plays O")
        board = get_valid_move(board, "O")
        IO.puts(TicTacToe.Board.board_string(board))
        play_game(board, p1, p2, counter + 2)
    end
  end

  defp get_valid_move(board, piece) do
    case get_move(board, piece) do
      {:ok, board} ->
        board

      {:error, _} ->
        IO.puts("Invalid move. Please try again.")
        get_valid_move(board, piece)
    end
  end

  defp get_move(board, piece) do
    row = IO.gets("Enter row:") |> String.trim() |> String.to_integer()
    column = IO.gets("Enter column:") |> String.trim() |> String.to_integer()
    TicTacToe.Board.edit_board(board, row, column, piece)
  end
end
