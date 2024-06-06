defmodule TicTacToe do
  @moduledoc """
  Documentation for `TicTacToe`.
  """
  alias TicTacToe.Board
  alias TicTacToe.Terminal

  def play(p1 \\ "P1", p2 \\ "P2") do
    board = Board.create_board()
    Terminal.game_welcome(board, p1, p2)
    play_game(board, p1, p2, 0, "X")
  end

  def play_game(board, p1, p2, counter, symbol) do
    case Board.check_win(board) do
      true ->
        Terminal.winner(symbol, p1, p2)

      false ->
        case counter do
          9 ->
            Terminal.tie()

          _ ->
            case symbol do
              "O" ->
                [row, col] = Terminal.prompt_move(board, p1, p2, "O")
                board = Board.edit_board(board, row, col, "O")
                Terminal.print_board(board)
                play_game(board, p1, p2, counter + 1, "X")

              "X" ->
                [row, col] = Terminal.prompt_move(board, p1, p2, "X")
                board = Board.edit_board(board, row, col, "X")
                Terminal.print_board(board)
                play_game(board, p1, p2, counter + 1, "O")
            end
        end
    end
  end
end
