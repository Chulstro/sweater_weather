class Routes
  attr_reader :location, :routes, :forecast

  def initialize(weather, routes, location)
    @location = location
    @routes = format_routes(routes)
    @forecast = weather
  end

  def format_routes(routes)
    routes[:routes].map do |route|
      {
        name: route[:name],
        type: route[:type],
        rating: route[:rating],
        location: route[:location],
        distance_to_route: GeocodingService.new.distance_between()
      }
    end
  end
end
