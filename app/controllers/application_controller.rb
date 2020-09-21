class ApplicationController < ActionController::API
  # Added here to use in forecast controller later
  def get_location(location)
    GeocodingService.new.city_to_latlon(params[:location])
  end
end
