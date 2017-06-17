defmodule FizzBuzz do
  def upto(n) when n > 0 do
    _upto(n, [])
  end

  defp _upto(0, result) do
    result
  end

  defp _upto(number, result) do
    action =
      cond do
        rem(number, 5) === 0 and rem(number, 3) === 0 ->
          "FizzBuzz"

        rem(number, 3) === 0 ->
          "Fizz"

        rem(number, 5) === 0 ->
          "Buzz"

        true -> number
      end

    _upto(number - 1, [action | result])
  end
end

IO.inspect FizzBuzz.upto(20)
