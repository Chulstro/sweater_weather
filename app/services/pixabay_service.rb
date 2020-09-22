class PixabayService
  def city_image(location)
    city = location.split(",").first
    Background.new(to_json("?q=#{city}")[:hits].first, location)
  end

  private

  def to_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('https://pixabay.com/api/') do |f|
      f.params[:key] = ENV['PIXABAY_KEY']
    end
  end
end
