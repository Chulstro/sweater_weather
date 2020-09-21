class Routes
  attr_reader :location, :routes, :forecast, :id

  def initialize(location)
    @id = 1
    @location = location[:city]
    @routes = format_routes(climb_suggestions(location))
    @forecast = format_weather(weather(location))
  end

  def weather(location)
    OpenWeatherService.new.current_weather(location[:coord])
  end

  def climb_suggestions(location)
    MountainProjectService.new.nearby_routes(location[:coord])
  end

  def format_routes(routes)
    routes[:routes].map do |route|
      lat = route[:latitude]
      lon = route[:longitude]
      {
        name: route[:name],
        type: route[:type],
        rating: route[:rating],
        location: route[:location],
        distance_to_route: GeocodingService.new.distance_between(@location, "#{lat},#{lon}")
      }
    end
  end

  def format_weather(weather_info)
    {
      summary: weather_info[:weather][0][:description],
      temperature: temp_convert(weather_info[:main][:temp]).to_i
    }
  end

  def temp_convert(temp_k)
    (temp_k - 273.15) * 5 / 9 + 32
  end
end
