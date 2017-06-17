fibonacci = fn ({f1, f2}) ->
  { f1, {f2, f1 + f2} }
end

my_fibonacci = Stream.unfold({0, 1}, fibonacci)
  |> Enum.take(15)


IO.inspect my_fibonacci
