defmodule TicTacToe do
  @moduledoc """
  Documentation for `TicTacToe`.
  """
  def start(p1 \\ "P1", p2 \\ "P2") do
    board = Board.create_board()
    IO.puts("Welcome #{p1} and #{p2} \n #{board}")
  end
end
