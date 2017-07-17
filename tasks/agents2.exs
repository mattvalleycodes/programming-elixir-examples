Agent.start(fn -> 1 end, name: Sum)
default_state = Agent.get(Sum, &(&1))
IO.puts "The default state is [#{default_state}]"

Agent.update(Sum, &(&1 + 99))
new_state = Agent.get(Sum, &(&1))
IO.puts "The new state is [#{new_state}]"
