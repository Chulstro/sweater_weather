class Api::V1::TripsController < ApplicationController
  def show
    user = User.find_by(api_key: params[:api_key])
    if user.nil?
      render json: {error: "Unauthorized request"}, status: 401
    else
      trip = TripFacade.find_trip(trip_params)
      render json: TripSerializer.new(trip)
    end
  end

  def trip_params
    params.permit(:origin, :destination)
  end
end
