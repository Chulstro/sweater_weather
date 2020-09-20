class Forecast
  def initialize(weather, location)
    @current = weather[:current]
    @hourly_info = HourlyForecast.new(weather[:hourly])
    @weekly_info = DailyForecast.new(weather[:daily])
    @location = location_format(location)
  end

  def location_format(location)
    GeocodingService.new.latlon_to_city(location)
  end
end
