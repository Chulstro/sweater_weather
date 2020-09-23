class Api::V1::ForecastController < ApplicationController
  def index
    weather_info = WeatherFacade.get_forecast(params[:location])
    render json: ForecastSerializer.new(weather_info)
  end
end
