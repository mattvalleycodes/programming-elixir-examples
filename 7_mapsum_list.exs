defmodule ListOps do
  def mapsum(list, func) do
    result = Enum.map list, func
    _sum result
  end

  defp _sum([]), do: 0
  defp _sum([head|tail]) do
    head + _sum(tail)
  end
end


square = &(&1 * &1)
IO.inspect ListOps.mapsum([1, 2, 3], square)
