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
end
