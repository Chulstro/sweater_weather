require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:password_digest)}
  end

  describe "instance methods" do
    it '#create_api_key' do
      user = User.create({
        email: 'nerds@example.com',
        password: 'password',
        password_confirmation: 'password'
        })

      initial_key = user.api_key
      expect(user.api_key).to eq(initial_key)

      user.create_api_key

      expect(user.api_key).to_not eq(initial_key)
      expect(user.api_key.length).to eq(36)
    end
  end
end
