defmodule LineSigil do
  def sigil_l(lines, _opt) do
    lines |> String.rstrip |> String.split("\n")
  end
end


defmodule Example do
  import LineSigil

  def lines do
    ~l"""
    Line one
    Line two
    Line three
    Line four
    """
  end
end
