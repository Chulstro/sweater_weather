require 'rails_helper'

RSpec.describe "When calling the background endpoint" do
  it 'provides an image and location' do
    get '/api/v1/backgrounds?location=denver,co'
    expect(response).to have_http_status(:success)

    background = JSON.parse(response.body, symbolize_names: true)

    expect(background[:data].keys).to match_array([:type, :id, :attributes])
    expect(background[:data][:attributes].keys).to match_array([:location, :image_url, :credit])
    expect(background[:data][:attributes].keys.length).to eq(3)
    expect(background[:data][:attributes][:credit].keys).to match_array([:source, :author])
  end
end
