defmodule WeatherHistory do
  def for_location([], _location), do: []

  def for_location([[timestamp, location, temprature, rain] | tail], location) do
    [[timestamp, location, temprature, rain] | for_location(tail, location)]
  end

  def for_location([_ | tail], location) do
    for_location(tail, location)
  end
end
