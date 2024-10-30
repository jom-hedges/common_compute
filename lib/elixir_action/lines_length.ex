defmodule ElixirAction.LinesLength do
  @moduledoc"""
    An exercise from Elixir in Action, p. 110

    A function that returns a list of numbers, with each
    line representing the length of a corresponding line
    from the file voyage.txt
    """
  def lines_length!(path) do
    File.stream!(path)
    |> Stream.map(&String.trim_trailing(&1, "\n"))
    |> Stream.with_index()
    # TODO: ran out of time, but perform transformations, then implement something like Enum.each(fn {line, index} -> IO.puts())
  end
end
