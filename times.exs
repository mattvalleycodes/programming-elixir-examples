defmodule Times do
  def double(n), do: n * 2
  def tripple(n) do
    n * 3
  end

  def quadruple(n) do
    2 * double(n)
  end
end
