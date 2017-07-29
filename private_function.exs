defmodule PrivateFunction do
  defp call_me_if_you_can() do
    IO.puts "Call me if you can!"
  end

  def public_func() do
    call_me_if_you_can()
  end
end
