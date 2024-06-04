defmodule TicTacToe.Board do
  def create_board() do
    [
      ["-", "-", "-"],
      ["-", "-", "-"],
      ["-", "-", "-"]
    ]
  end

  def board_string(board) do
    Enum.map_join(board, "\n", fn row ->
      Enum.join(row, " | ")
    end)
  end

  def edit_board(board, row, column, symbol) do
    case Enum.at(Enum.at(board, row), column) do
      "-" ->
        {:ok,
         List.update_at(board, row, fn inner_list ->
           List.replace_at(inner_list, column, symbol)
         end)}

      _ ->
        {:error, "Invalid Position"}
    end
  end

  def check_win(board) do
    win_conditions = [
      # Horizontal
      [[0, 0], [0, 1], [0, 2]],
      [[1, 0], [1, 1], [1, 2]],
      [[2, 0], [2, 1], [2, 2]],
      # Vertical
      [[0, 0], [1, 0], [2, 0]],
      [[0, 1], [1, 1], [2, 1]],
      [[0, 2], [1, 2], [2, 2]],
      # Diagonal
      [[0, 0], [1, 1], [2, 2]],
      [[0, 2], [1, 1], [2, 0]]
    ]

    Enum.any?(win_conditions, fn [a, b, c] ->
      Enum.at(Enum.at(board, Enum.at(a, 0)), Enum.at(a, 1)) != "-" &&
        Enum.at(Enum.at(board, Enum.at(a, 0)), Enum.at(a, 1)) ==
          Enum.at(Enum.at(board, Enum.at(b, 0)), Enum.at(b, 1)) &&
        Enum.at(Enum.at(board, Enum.at(a, 0)), Enum.at(a, 1)) ==
          Enum.at(Enum.at(board, Enum.at(c, 0)), Enum.at(c, 1))
    end)
  end
end
