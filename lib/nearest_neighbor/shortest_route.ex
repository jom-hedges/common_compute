defmodule NearestNeighbor.ShortestRoute do
  @moduledoc false

  def shortest_route(points, route \\ [])

  # terminates recursion, add first point as last on to the route
  def shortest_route([], route), do: route ++ [List.first(route)]

  # last one in the recursion
  def shortest_route([{point, _neighbors} | []], route) do
    shortest_route([], route ++ [point])
  end

  # sorts the nearest neighbor to the beginning of the List
  def shortest_route([{point, neighbors} | tail], route) do
    nearest_neighbor = nearest_neighbor(neighbors, route)
    tail
    |> List.keydelete(point, 0)
    |> List.keydelete(nearest_neighbor, 0)
    |> List.insert_at(0, List.keyfind(tail, nearest_neighbor, 0))
    |> shortest_route(route ++ [point])
  end

  # returns nearest_neighbor of given point
  defp nearest_neighbor(neighbors, route) do
    neighbors
    |> Enum.filter(fn {_point, distance} -> distance !== 0.0 && distance !== 0 end)
    |> Enum.filter(fn {point, _distance} -> !Enum.member?(route, point) end)
    |> List.keysort(1)
    |> List.first
    |> elem(0)
  end
end
