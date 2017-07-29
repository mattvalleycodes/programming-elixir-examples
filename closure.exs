prefix_with = fn
  prefix -> (
    fn
      something -> "#{prefix} #{something}"
    end
  )
end

mrs = prefix_with.("Mrs")
IO.puts mrs.("Smith")

IO.puts prefix_with.("Elixir").("Rocks")
