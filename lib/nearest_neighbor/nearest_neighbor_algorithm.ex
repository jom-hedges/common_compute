defmodule NearestNeighborAlgorithm do
  @moduledoc"""
    Nearest neighbor algorithm written in Elixir
    """
  
  @doc"""
    Calculates the shortest possible route between multiple points.
    
    Returns a list
    """
    
  defdelegate shortest_route(points), to: NearestNeighborAlgorithm.ShortestRoute
end
