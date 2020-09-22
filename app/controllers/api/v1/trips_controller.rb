class Api::V1::TripsController < ApplicationController
  def show
    #route to facade
    render json: TripSerializer.new(trip)
  end
end
