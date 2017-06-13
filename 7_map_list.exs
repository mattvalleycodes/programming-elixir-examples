defmodule ListOps do
  def map([], _func), do: []
  def map([head|tail], func), do: [func.(head) | map(tail, func)]
end



IO.inspect ListOps.map [1, 2, 3], &(&1 + 1)
IO.inspect ListOps.map [1, 2, 3], &(&1 * &1)
