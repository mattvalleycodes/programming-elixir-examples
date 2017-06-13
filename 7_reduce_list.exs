defmodule ListOps do
  def reduce([], value, _), do: value

  def reduce([head|tail], value, func) do
    reduce(tail, func.(head, value), func)
  end
end



sum = fn (x, y) -> x + y end


IO.puts ListOps.reduce([], 0, sum)

IO.puts ListOps.reduce([1, 2], 0, sum)

IO.puts ListOps.reduce([1, 2, 3, 4, 5], 0, sum)



concat = fn (a, b) -> "#{b} #{a}" end


IO.puts ListOps.reduce(["Hello", "Mehdi"], "", concat)
