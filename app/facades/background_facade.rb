class BackgroundFacade
  def self.find_image(location)
    image_info = PixabayService.new.city_image(location)
    Background.new(image_info[:hits].first, location)
  end
end
