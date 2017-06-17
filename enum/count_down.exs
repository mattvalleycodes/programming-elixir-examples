defmodule Countdown do
  def sleep(seconds) do
    receive do
      after seconds * 1000 -> nil
    end
  end

  def say(text) do
    spawn fn -> :os.cmd('say #{text}') end
  end

  def timer do
    Stream.resource(
      # return total number of seconds left to the beginning of the next minute
      fn ->
        {_h, _m, s} = :erlang.time
        60 - s - 1
      end,

      fn
        0 ->
          {:halt, 0}

        count ->
          sleep(1)
          { [inspect(count)], count - 1 }
      end,

      fn _ -> nil end
    )
  end
end

Countdown.timer
  |> Stream.each(&IO.puts/1)
  |> Stream.each(&Countdown.say/1)
  |> Enum.take(5)
