class Background
  attr_reader :location, :image_url, :credit, :id

  def initialize(image_info, location)
    @id = image_info[:id]
    @location = location
    @image_url = image_info[:pageURL]
    @credit = format_credit(image_info)
  end

  def format_credit(image_info)
    {
      source: "pixabay.com",
      author: image_info[:user]
    }
  end
end
