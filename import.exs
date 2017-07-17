defmodule SampleModule do
  def func(list) do
    import List, only: [flatten: 1]

    IO.inspect flatten(list)
  end
end
