defmodule Ticker do
  @interval 2000
  @name :ticker

  def start do
    pid = spawn(__MODULE__, :generator, [[]])
    :global.register_name(@name, pid)
  end


  def register(client_pid) do
    send :global.whereis_name(@name), { :register, client_pid }
  end


  def generator(clients) do
    receive do
      { :register, client_pid } ->
        IO.puts "registering #{inspect(client_pid)}"

        generator([client_pid | clients])

    after @interval ->
      IO.puts "tick"

      Enum.each clients, fn client_pid ->
        send client_pid, { :tick }
      end

      generator(clients)
    end
  end
end
