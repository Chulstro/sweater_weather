class Api::V1::RoutesController < ApplicationController
  def index
    render json: RoutesSerializer.new(Routes.new(get_location))
  end

  private

  # Maybe move into application controller
  def get_location
    GeocodingService.new.city_to_latlon(params[:location])
  end
end
