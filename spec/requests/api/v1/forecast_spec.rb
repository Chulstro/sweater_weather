require 'rails_helper'

RSpec.describe "When calling the forecast endpoint" do
  it 'provides only pertinent information' do
    get '/api/v1/forecast?location=longmont,co'
    expect(response).to have_http_status(:success)

    forecast = JSON.parse(response.body, symbolize_names: true)

    expect(forecast[:data].keys).to match_array([:id, :type, :attributes])
    expect(forecast[:data][:attributes].keys).to match_array([:location, :current, :weekly_info, :hourly_info])

  end
end
