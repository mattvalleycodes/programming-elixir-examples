defmodule Spawn2 do
  def great do
    receive do
      { sender, name } ->
        send sender, { :ok, "Hello, #{name}!" }
        great()
    end
  end
end


pid = spawn(Spawn2, :great, [])
send pid, {self(), "World!"}

receive do
  { :ok, message } ->
    IO.puts message
end

send pid, { self(), "Donya!" }

receive do
  { :ok, message } ->
    IO.puts message

  after 500 ->
      IO.puts "The greeeter has gone away!"
end
