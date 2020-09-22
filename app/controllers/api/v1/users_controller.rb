class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.new(user), status: 201
    else
      render json: user.errors.full_messages, status: 401
    end
  end

  def show
    user = User.find_by(email: params[:email])
    if !user.nil? && user.authenticate(params[:password])
      render json: UserSerializer.new(user), status: 200
    else
      render json: {error: "You input an incorrect email or password"}, status: 400
    end
  end

  private

  def user_params
    params.permit(:email, :password_confirmation, :password)
  end
end
