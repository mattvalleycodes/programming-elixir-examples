defmodule ListOps do
  def sum([]), do: 0
  def sum([head | tail]), do: head + sum(tail)
end


IO.puts ListOps.sum([])
IO.puts ListOps.sum([1, 2])
IO.puts ListOps.sum([1, 2, 3, 4, 5])
