defmodule Foo do
  def func(list) do
    alias IO, as: log

    log.inspect list
  end
end
