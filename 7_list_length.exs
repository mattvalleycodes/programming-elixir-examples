# Printing length of a list using head and tail.
defmodule MyList do
  @author "mehdivk"

  def len([]),               do: 0

  def len([_head | tail]),    do: 1 + len(tail)
end

IO.puts MyList.len([])
IO.puts MyList.len([1, 2, 3])
IO.puts MyList.len([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
