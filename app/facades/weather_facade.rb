class WeatherFacade

  def self.get_forecast(location)
    location_info = GeocodingService.new.city_to_latlon(location)
    latlon = location_info[:results][0][:locations][0][:latLng]
    weather_info = OpenWeatherService.new.pull_forecast(latlon)
    Forecast.new(weather_info, location)
  end
end
