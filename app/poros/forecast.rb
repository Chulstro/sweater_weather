class Forecast
  attr_reader :current, :hourly_info, :weekly_info, :location, :id

  def initialize(weather, location)
    @id = 1
    @current = weather[:daily].first
    @hourly_info = format_hourly(weather[:hourly])
    @weekly_info = format_weekly(weather)
    @location = location
  end

  def format_hourly(weather_by_hour)
    weather_by_hour[0..7].map do |hour|
      {
        temp: temp_convert(hour[:temp]).to_i,
        condition: hour[:weather][0][:description],
        time: Time.at(hour[:dt]).strftime("%l %p")
      }
    end
  end

  def format_weekly(weather)
    weather[:daily][0..4].map do |day|
      {
        precipitation: accumulation(day),
        condition: day[:weather][0][:description],
        day: Time.at(day[:dt]).strftime("%A"),
        temp_min: temp_convert(day[:temp][:min]).to_i,
        temp_max: temp_convert(day[:temp][:max]).to_i
      }
    end
  end

  def temp_convert(temp_k)
    (temp_k - 273.15) * 5 / 9 + 32
  end

  def accumulation(weather_by_day)
    {
      snow: weather_by_day[:snow],
      rain: weather_by_day[:rain]
    }
  end
end
