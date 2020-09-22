class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.new(user), status: 201
    else
      render json: user.errors.full_messages, status: 401
    end
  end

  private

  def user_params
    params.permit(:email, :password_confirmation, :password)
  end
end
