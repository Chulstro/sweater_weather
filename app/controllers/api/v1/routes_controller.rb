class Api::V1::RoutesController < ApplicationController
  def index
    # Look into moving service calls into poro
    weather_info = OpenWeatherService.new.current_weather(get_location[:coord])
    route_info = MountainProjectService.new.nearby_routes(get_location[:coord])
    climbing_info = Routes.new(weather_info, route_info, get_location[:city])
    binding.pry
    render json: RoutesSerializer.new(climbing_info)
  end

  private

  # Maybe move into application controller
  def get_location
    GeocodingService.new.city_to_latlon(params[:location])
  end
end
