defmodule Raindrops do
  @spec convert(pos_integer) :: String.t()
  def convert(number) when rem(number, 3 * 5 *7) == 0, do: "PlingPlangPlong"
  def convert(number) when rem(number, 3 * 5) == 0, do: "PlingPlang"
  def convert(number) when rem(number, 3 * 7) == 0, do: "PlingPlong"
  def convert(number) when rem(number, 5 * 7) == 0, do: "PlangPlong"
  def convert(number) when rem(number, 3) == 0, do: "Pling"
  def convert(number) when rem(number, 5) == 0, do: "Plang"
  def convert(number) when rem(number, 7) == 0, do: "Plong"
  def convert(number), do: Integer.to_string(number)
end
