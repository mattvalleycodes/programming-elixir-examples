defmodule WeatherHistory do
  def for_location_27([]), do: []

  def for_location_27([[time, 27, temprature, rainfall] | tail]) do
    [[time, 27, temprature, rainfall] | for_location_27(tail)]
  end

  def for_location_27([_ | tail]) do
    for_location_27(tail)
  end
end
