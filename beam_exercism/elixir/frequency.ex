defmodule Frequency do
  @spec start_reliability_check(fun(), String.t()) :: map()
  def start_reliability_check(calculator, input) do
    {:ok, pid} = Task.start_link(fn -> calculator.(input) end)
    %{input: input, pid: pid}
  end

  @spec await_reliability_check_result(map(), map()) :: map()
  def await_reliability_check_result(%{pid: pid, input: input}, results) do
    output =
      receive do
        {:EXIT, ^pid, :normal} -> :ok
        {:EXIT, ^pid, _reason} -> :error
      after
        100 -> :timeout
      end

    Map.put(results, input, output)
  end

  @spec reliability_check(fun(), list(String.t())) :: map()
  def reliability_check(calculator, inputs) do
    original_trap_flag = Process.flag(:trap_exit, true)

    result = 
      Enum.map(inputs, fn i -> start_reliability_check(calculator, i) end)
      |> Enum.reduce(%{}, &await_reliability_check_result/2)

    true = Process.flag(:trap_exit, original_trap_flag)

    result
  end

  @spec correctness_check(fun(), list(String.t())) :: list(term())
  def correctness_check(calculator, inputs) do
    original_trap_flag = Process.flag(:trap_exit, true)

    result =
      inputs
      |> Enum.map(fn i -> Task.async(fn -> calculator.(i) end) end)
      |> Enum.map(fn t -> Task.await(t, 100) end)

    true = Process.flag(:trap_exit, original_trap_flag)

    result
  end
end
