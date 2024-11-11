defmodule ElixirAction.LinesLength do
  @moduledoc"""
    An exercise from Elixir in Action, p. 110

    A function that returns a list of numbers, with each
    line representing the length of a corresponding line
    from the file voyage.txt
    """
  def lines_length!(path) do
    path
    |> filtered_lines!()
    |> Enum.map(&String.length/1)
  end

  defp filtered_lines!(path) do
    path
    |> File.stream!()
    |> Stream.map(&String.trim_trailing(&1, "\n"))
  end
end
