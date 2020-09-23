class Api::V1::ForecastController < ApplicationController
  def index
    weather_info = WeatherFacade.get_forecast(params[:location])
    # weather_info = OpenWeatherService.new.pull_forecast(get_lat_lon[:coord])
    # forecast = Forecast.new(weather_info, get_lat_lon[:city])
    render json: ForecastSerializer.new(weather_info)
  end

  private

  # def get_lat_lon
  #   GeocodingService.new.city_to_latlon(params[:location])
  # end
end
