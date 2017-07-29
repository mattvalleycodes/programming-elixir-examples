my_func = fn
  (0, 0, _) -> "FizzBuzz"
  (0, _, _) -> "Fizz"
  (_, 0, _) -> "Buzz"
  (_, _, a) -> a
end

IO.puts my_func.(0, 0, 'foo')
IO.puts my_func.(0, "a", "b")
IO.puts my_func.(1, 0, "a")
IO.puts my_func.(:a, :b, "FOOOOO")


another_func = fn
  n -> my_func.(rem(n, 3), rem(n, 5), n)
end

IO.puts another_func.(10)
IO.puts another_func.(11)
IO.puts another_func.(12)
IO.puts another_func.(13)
IO.puts another_func.(14)
IO.puts another_func.(15)
IO.puts another_func.(16)
IO.puts another_func.(17)
