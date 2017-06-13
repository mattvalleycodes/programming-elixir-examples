defmodule ListOps do
  def sum(list), do: _sum(list, 0)
  defp _sum([], total), do: total
  defp _sum([head | tail], total), do: _sum(tail, total + head)
end


IO.puts ListOps.sum([])
IO.puts ListOps.sum([1, 2])
IO.puts ListOps.sum([1, 2, 3, 4, 5])
