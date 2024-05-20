defmodule CommonComputeTest do
  use ExUnit.Case
  doctest CommonCompute

  test "greets the world" do
    assert CommonCompute.hello() == :world
  end
end
