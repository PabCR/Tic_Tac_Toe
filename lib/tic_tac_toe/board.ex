defmodule TicTacToe.Board do
  def create_board() do
    [
      ["-", "-", "-"],
      ["-", "-", "-"],
      ["-", "-", "-"]
    ]
  end

  def edit_board(board, row, column, symbol) do
    List.update_at(board, row, fn inner_list ->
      List.replace_at(inner_list, column, symbol)
    end)
  end

  def check_win([[y, y, y], _, _]) when y != "-", do: true
  def check_win([_, [y, y, y], _]) when y != "-", do: true
  def check_win([_, _, [y, y, y]]) when y != "-", do: true
  def check_win([[y, _, _], [y, _, _], [y, _, _]]) when y != "-", do: true
  def check_win([[_, y, _], [_, y, _], [_, y, _]]) when y != "-", do: true
  def check_win([[_, _, y], [_, _, y], [_, _, y]]) when y != "-", do: true
  def check_win([[y, _, _], [_, y, _], [_, _, y]]) when y != "-", do: true
  def check_win([[_, _, y], [_, y, _], [y, _, _]]) when y != "-", do: true

  def check_win(_), do: false
end
