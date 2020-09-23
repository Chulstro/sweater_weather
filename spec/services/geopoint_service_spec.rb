require 'rails_helper'

describe GeocodingService do
  context 'instance methods' do
    context '#city_to_latlon' do
      it "Returns latitude and longitude" do
        location = "denver,co"
        service = GeocodingService.new
        latlon = service.city_to_latlon(location)
        expect(latlon).to be_a Hash

        expect(latlon.keys).to match_array([:info, :options, :results])
        expect(latlon[:results][0][:locations][0][:latLng].keys).to match_array([:lat, :lng])
      end
    end
  end
end
