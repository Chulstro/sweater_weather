require 'rails_helper'

RSpec.describe "When calling the session endpoint" do
  it 'opens a new session' do
    user = User.create({
      email: 'nerds@example.com',
      password: 'password',
      password_confirmation: 'password'
      })

    login_params = {
      email: user.email,
      password: 'password'
    }

    post '/api/v1/sessions', params: login_params
    expect(response.status).to eq(200)

    login_response = JSON.parse(response.body, symbolize_names: true)

    expect(login_response[:data].keys).to match_array([:type, :id, :attributes])
    expect(login_response[:data].count).to eq(3)
    expect(login_response[:data][:attributes].keys).to match_array([:email, :api_key])
    expect(login_response[:data][:attributes].count).to eq(2)

  end

  it "sends error for incorrect form" do
    User.create({
      email: 'nerds@example.com',
      password: 'password',
      password_confirmation: 'password'
      })

    login_params = {
        email: 'wrong@example.com',
        password: 'password'
      }

    post '/api/v1/sessions', params: login_params
    expect(response.status).to eq(400)

    login_response = JSON.parse(response.body, symbolize_names: true)

    expect(login_response[:error]).to eq("You input an incorrect email or password")

    login_params = {
        email: 'nerds@example.com',
        password: 'Cleopatra'
      }

    post '/api/v1/sessions', params: login_params
    expect(response.status).to eq(400)

    login_response = JSON.parse(response.body, symbolize_names: true)

    expect(login_response[:error]).to eq("You input an incorrect email or password")
  end
end
