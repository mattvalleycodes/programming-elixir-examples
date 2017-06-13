# Uses head and tail to generate square items in a list

defmodule ListOps do
  def square([]) do
    []
  end

  def square([head | tail]) do
    [head * head | square(tail)]
  end
end
