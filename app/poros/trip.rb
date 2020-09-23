class Trip
  attr_reader :id, :origin, :destination, :travel_time, :weather

  def initialize(weather_info, map_info)
    @id = 1
    @origin= format_destination(map_info[:route][:locations][0])
    @destination = format_destination(map_info[:route][:locations][1])
    @travel_time = format_time(map_info[:route][:time])
    @weather = format_weather(weather_info[:temp])
  end

  private

  def format_weather(temp_k)
    ((temp_k - 273.15) * 5 / 9 + 32).to_i
  end

  def format_time(seconds)
    (seconds/60/60.to_f).round
  end

  def format_destination(location)
    "#{location[:adminArea5]}, #{location[:adminArea3]}"
  end
end
