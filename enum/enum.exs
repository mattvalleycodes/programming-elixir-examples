defmodule MyList do
  def all?([], _fn) do
    true
  end

  def all?([head | tail], func) do
    if func.(head) do
      all?(tail, func)
    else
      false
    end
  end


  def each?([], _fn) do
  end

  def each?([head | tail], func) do
    func.(head)
    each?(tail, func)
  end


  defp _filter([], result, _func) do
    result
  end

  defp _filter([head | tail], result, func) do
    if func.(head) do
      _filter(tail, [head | result], func)
    else
      _filter(tail, result, func)
    end
  end

  def filter(list, func) do
    _filter(list, [], func)
  end
end


IO.puts "all?([], &(&1 > 10)) --> #{MyList.all?([], &(&1 > 10))}"
IO.puts "all?([1, 2, 3, 4, 5], &(&1 > 10)) --> #{MyList.all?([1, 2, 3, 4, 5], &(&1 > 10))}"
IO.puts "all?([11, 20, 30], &(&1 > 10)) --> #{MyList.all?([11, 20, 30], &(&1 > 10))}"


numbers = Enum.to_list 1..10
MyList.each? numbers, &(IO.puts("Hello #{&1}"))


IO.inspect MyList.filter numbers, &(&1 > 5)
