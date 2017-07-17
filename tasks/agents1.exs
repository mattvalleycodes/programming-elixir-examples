{ :ok, count } = Agent.start(fn -> 0 end)

default_state = Agent.get(count, &(&1))
IO.puts "The default state is #{default_state}"

increase = &(&1 + 1)
Agent.update(count, increase)
Agent.update(count, increase)

current_state = Agent.get(count, &(&1))
IO.puts "The current state is #{current_state}"
