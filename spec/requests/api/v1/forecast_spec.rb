require 'rails_helper'

RSpec.describe "When calling the forecast endpoint" do
  it 'provides only pertinent information' do
    get '/api/v1/forecast?location=longmont,co'
    expect(response).to have_http_status(:success)

    forecast = JSON.parse(response.body)

    expect(hash_body.keys).to match_array([:location, :date, :daily_info, :hourly_info])

  end
end
