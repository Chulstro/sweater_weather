require 'rails_helper'

describe MountainProjectService do
  context 'instance methods' do
    context '#nearby_routes' do
      it "returns all nearby climbs in a 100 mile radius" do
        location = {lat: 40.2562, lng: -105.6138}
        service = MountainProjectService.new
        routes = service.nearby_routes(location)
        expect(routes).to be_a Hash
        expect(routes[:routes]).to be_an Array
        route_data = routes[:routes].first

        expect(route_data).to have_key :name
        expect(route_data).to have_key :type
        expect(route_data).to have_key :rating
        expect(route_data).to have_key :location
      end
    end
  end
end
