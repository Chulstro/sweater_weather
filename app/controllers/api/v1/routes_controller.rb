class Api::V1::RoutesController < ApplicationController
  def index
    binding.pry
    get_location
    OpenWeatherService.new.current_weather()
    #need suggested routes
    render json: climbing_info
  end

  private

  # Maybe move into application controller
  def get_location
    GeocodingService.new.city_to_latlon(params[:location])
  end
end
