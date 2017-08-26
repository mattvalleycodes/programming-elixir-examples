defmodule Boom do

  defp raise_error(0) do
    IO.puts "No error"
  end


  defp raise_error(val = 1) do
    IO.puts "About to divide by zero"
    1 / (val - 1)
  end


  defp raise_error(2) do
    IO.puts "About to call a function that does not exist"
    raise_error(99)
  end


  defp raise_error(3) do
    IO.puts "About to create a directory with not permission"
    File.mkdir!("/not_allowed")
  end


  def start(n) do
    try do
      raise_error(n)
    rescue
      [ FunctionClauseError, RuntimeError ] ->
        IO.puts "no function match or runtime error"

      error in [ ArithmeticError ] ->
        IO.inspect error
        IO.puts "Uh-Oh! Arithmetic error"
        reraise "too late, we're doomed", System.stacktrace

      other_errors ->
        IO.puts "Disaster! #{inspect other_errors}"
    after
      IO.puts "Done!"
    end
  end

end
