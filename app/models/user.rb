class User < ApplicationRecord
  after_create :create_api_key
  #Is this right?
  has_secure_password

  validates_presence_of :email
  validates_presence_of :password_digest

  def create_api_key
    self.update(api_key: SecureRandom.hex)
  end

end
