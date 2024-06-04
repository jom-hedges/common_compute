defmodule Quicksort.RecursiveSum do
  def sum([]), do: 0
  def sum([head | tail]), do: head + sum(tail)
end

IO.puts(RecursiveSum.sum([1, 2, 3, 4]))
