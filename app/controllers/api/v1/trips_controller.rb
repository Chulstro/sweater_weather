class Api::V1::TripsController < ApplicationController
  def show
    trip = TripFacade.find_trip(trip_params)
    render json: TripSerializer.new(trip)
  end

  def trip_params
    params.permit(:origin, :destination)
  end
end
