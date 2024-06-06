defmodule TicTacToe.Terminal do
  def game_welcome(board, p1, p2) do
    IO.puts("Welcome to Tic Tac Toe")
    IO.puts("Player 1: #{p1} plays X")
    IO.puts("Player 2: #{p2} plays O")
    IO.puts(board_string(board))
  end

  def board_string(board) do
    Enum.map_join(board, "\n", fn row ->
      Enum.join(row, " | ")
    end)
  end

  def print_board(board) do
    IO.puts(board_string(board))
  end

  def winner(symbol, p1, p2) do
    IO.puts("------------------------------")

    case symbol do
      "X" ->
        IO.puts("Player #{p2} wins")

      "O" ->
        IO.puts("Player #{p1} wins")
    end

    IO.puts("Game Over")
  end

  def tie() do
    IO.puts("It's a tie")
    IO.puts("Game Over")
  end

  def prompt_move(board, p1, p2, symbol) do
    case symbol do
      "X" ->
        IO.puts("Player: #{p1} plays #{symbol}")
        get_move(board)

      "O" ->
        IO.puts("Player: #{p2} plays #{symbol}")
        get_move(board)
    end
  end

  defp get_move(board) do
    row = IO.gets("Enter row:") |> string_to_integer()
    column = IO.gets("Enter column:") |> string_to_integer()

    case check_valid_input?(board, row, column) do
      true ->
        [row, column]

      false ->
        IO.puts("Invalid move. Please try again.")
        get_move(board)
    end
  end

  defp string_to_integer(string) do
    String.trim(string) |> String.to_integer()
  end

  defp check_valid_input?(board, row, column) do
    if row < 0 or row > 2 or column < 0 or column > 2 do
      false
    else
      case Enum.at(Enum.at(board, row), column) do
        "-" ->
          true

        _ ->
          false
      end
    end
  end
end
