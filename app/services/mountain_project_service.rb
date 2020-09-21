class MountainProjectService

  def nearby_routes(location)
    to_json("get-routes-for-lat-lon?lat=#{location[:lat]}&lon=#{location[:lng]}&maxDistance=100&maxResults=20")
  end

  private

  def to_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('https://www.mountainproject.com/data/') do |f|
      f.params[:key] = ENV['CLIMBING_KEY']
    end
  end
end
