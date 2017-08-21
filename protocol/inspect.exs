IO.puts "Default inspect for PID"
IO.puts inspect(self())



defimpl Inspect, for: PID do
  def inspect(pid, _opt) do
    "#PID " <> IO.iodata_to_binary(:erlang.pid_to_list(pid))
  end
end



IO.puts "Now, the customized version"
IO.puts inspect(self())
