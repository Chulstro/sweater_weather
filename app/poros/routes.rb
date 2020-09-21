class Routes
  attr_reader :location, :routes, :forecast, :id

  def initialize(weather, routes, location)
    @id = 1
    @location = location[:city]
    @routes = format_routes(routes)
    @forecast = format_weather(weather)
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
