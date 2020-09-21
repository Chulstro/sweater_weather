require 'rails_helper'

RSpec.describe 'When calling a climbing route endpoint' do
  it "should return route info and forecast info" do
    get "/api/v1/climbing_routes?location=vail,co"
    expect(response).to have_http_status(:success)

    routes = JSON.parse(response.body, symbolize_names: true)
    binding.pry

    expect(routes[:attributes].keys).to  match_array([:location, :routes, :forecast])
    expect(routes[:attributes][:forecast].keys).to  match_array([:summary, :temperature])
    expect(routes[:attributes][:routes][0].keys).to  match_array([:sname, :type, :rating, :location])
  end
end
