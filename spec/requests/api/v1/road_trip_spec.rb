require 'rails_helper'

RSpec.describe "When posting a road trip endpoint" do
  it "returns pertinent info" do
    User.create({
      email: 'nerds@example.com',
      password: 'password',
      password_confirmation: 'password'
      })
    trip_params = {
      origin: "denver,co",
      destination: "las vegas,nm",
      api_key: user.api_key
    }
    post '/api/v1/road_trip', params: trip_params

    trip_response = JSON.parse(response.body, symbolize_names: true)

    expect(trip_response[:data].keys).to match_array([:type, :id, :attributes])
    expect(trip_response[:data][:attributes].keys).to match_array([:origin, :destination, :travel_time, :weather])
    expect(trip_response[:data][:attributes].count).to eq(4)
  end
end
