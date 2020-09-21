require 'rails_helper'

describe OpenWeatherService do
  context 'instance methods' do
    context '#current_weather' do
      it "Returns weather info for location" do
        location = {lat: 40.2562, lng: -105.6138}
        service = OpenWeatherService.new
        weather = service.current_weather(location)
        expect(weather).to be_a Hash
        expect(weather[:weather]).to be_an Array

        expect(weather[:main]).to have_key :temp
        expect(weather[:weather][0]).to have_key :description
      end
    end
  end
end
