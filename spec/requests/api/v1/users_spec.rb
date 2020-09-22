require 'rails_helper'

RSpec.describe "When posting the user endpoint" do
  it 'creates a user in the database' do
    user_params = {email: "nerds@example.com",
                 password: "digimon4evr",
                 password_confirmation: "digimon4evr"}

    bad_user_params = {email: "nerds@example.com",
                 password: "password",
                 password_confirmation: "password"}

    post '/api/v1/users', params: user_params
    expect(response).to have_http_status(:success)

    user_response = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(201)
    expect(user_response[:data].keys).to match_array([:type, :id, :attributes])
    expect(user_response[:data].keys.count).to eq(3)
    expect(user_response[:data][:attributes].keys).to match_array([:email, :api_key])
    expect(user_response[:data][:attributes].keys.count).to eq(2)

    post '/api/v1/users', params: bad_user_params

    user_response = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(401)
  end
end
