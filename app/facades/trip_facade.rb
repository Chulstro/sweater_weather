class TripFacade

  def self.find_trip(params)
    map_info = GeocodingService.new.distance_between(params[:origin], params[:destination])
    latlon = map_info[:route][:locations][1][:latLng]
    weather_response = OpenWeatherService.new.pull_forecast(latlon)
    weather_info = weather_response[:hourly][weather_offset(map_info[:route][:time])]
    Trip.new(weather_info, map_info)
  end

  private

  def self.weather_offset(time)
    (time/60/60.to_f).round
  end
end
