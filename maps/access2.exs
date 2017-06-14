cast = [
  %{
    character: "Buttercup",
    actor: {"Robin", "Wright"},
    role: "princess"
  },
  %{
    character: "Westley",
    actor: {"Carey", "Elwes"},
    role: "farm boy"
  }
]

first_actor = IO.inspect get_in(cast, [Access.all(), :actor, Access.elem(1)])
IO.inspect first_actor


IO.puts "=================="

cast_reverse = get_and_update_in(cast, [Access.all(), :actor, Access.elem(1)],
  fn (val) -> {val, String.reverse(val)} end)
IO.inspect cast_reverse
