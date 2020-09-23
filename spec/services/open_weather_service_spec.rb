require 'rails_helper'

describe OpenWeatherService do
  context 'instance methods' do
    context '#current_weather' do
      it "Returns weather info for location" do
        location = {lat: 40.2562, lng: -105.6138}
        service = OpenWeatherService.new
        weather = service.pull_forecast(location)
        expect(weather).to be_a Hash

        expect(weather.keys).to match_array([:lat, :lon, :timezone, :timezone_offset, :current, :hourly, :daily])
        expect(weather[:current].keys).to match_array([:dt, :sunrise, :sunset, :temp, :feels_like, :pressure, :humidity, :dew_point, :uvi, :clouds, :visibility, :wind_speed, :wind_deg, :weather])
      end
    end
  end
end
