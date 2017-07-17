defmodule FibSolver do
  def fib(scheduler) do
    send scheduler, { :ready, self() }

    receive do
      { :fib, n, client } ->
        send client, { :result, n, fib_calc(n), self() }
        fib(scheduler)

      { :shutdown } ->
        exit(:normal)
    end
  end

  defp fib_calc(0), do: 0
  defp fib_calc(1), do: 1
  defp fib_calc(n), do: fib_calc(n - 1) + fib_calc(n - 2)
end

defmodule Scheduler do
  def run(number_of_workers, module, func, tasks) do
    (1..number_of_workers)
      |> Enum.map(fn(_) -> spawn(module, func, [self()]) end)
      |> schedule_workers(tasks, [])
  end

  defp schedule_workers(worker_pids, tasks, results) do
    receive do
      { :ready, pid } when length(tasks) > 0 ->
        [ next_task | remaining_tasks ] = tasks
        send pid, { :fib, next_task, self() }
        schedule_workers(worker_pids, remaining_tasks, results)

      # no more tasks to process
      { :ready, pid } ->
        send pid, { :shutdown }

        if (length(worker_pids) > 1) do
          schedule_workers(List.delete(worker_pids, pid), tasks, results)
        else
          Enum.sort(results, fn {n1, _}, {n2, _} -> n1 <= n2 end)
        end

      { :answer, number, result, _pid } ->
        schedule_workers(worker_pids, tasks, [{number, result} | result])
    end
  end
end

tasks = List.duplicate(37, 20)

Enum.each 1..10, fn number_of_workers ->
  { time, result } = :timer.tc(
    Scheduler, :run,
    [number_of_workers, FibSolver, :fib, tasks]
  )

  if number_of_workers == 1 do
    IO.puts inspect result
    IO.puts "\n #         time (s)"
  end

  :io.format "~2B         ~.2f~n", [number_of_workers, time/1_000_00.0]
end
