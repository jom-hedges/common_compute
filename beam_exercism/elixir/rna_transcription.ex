defmodule RnaTranscription do
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna |> Enum.map(&translate/1)
  end

  defp translate(?G), do: ?C 
  defp translate(?C), do: ?G
  defp translate(?A), do: ?T
  defp translate(?T), do: ?U

end
