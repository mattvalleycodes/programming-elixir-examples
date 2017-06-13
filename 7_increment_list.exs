defmodule ListOps do
  def increase([]) do
    []
  end

  def increase([head| tail]) do
    [ head + 1 | increase(tail)]
  end
end
