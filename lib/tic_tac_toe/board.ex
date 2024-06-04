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
end
