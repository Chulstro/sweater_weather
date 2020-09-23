class Api::V1::BackgroundsController < ApplicationController
  def show
    image_object = BackgroundFacade.find_image(params[:location])
    # image_object = PixabayService.new.city_image(params[:location])
    render json: BackgroundSerializer.new(image_object)
  end
end
