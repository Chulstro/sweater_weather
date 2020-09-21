class Api::V1::RoutesController < ApplicationController
  def index
    render json: RoutesSerializer.new(Routes.new(get_location(params[:location])))
  end
end
