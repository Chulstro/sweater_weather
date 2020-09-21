class GeocodingService

  def city_to_latlon(location)
    results = to_json("address?location=#{location}")
    {
    coord: results[:results][0][:locations][0][:latLng],
    city: "#{city(results)},#{state(results)}"
    }
  end

  # def latlon_to_city(location)
  #   session[:location]
  # end

  private

  def city(geopoint)
    geopoint[:results][0][:locations][0][:adminArea5]
  end

  def state(geopoint)
    geopoint[:results][0][:locations][0][:adminArea3]
  end

  def to_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('http://www.mapquestapi.com/geocoding/v1/') do |f|
      f.params[:key] = ENV['GEOCODING_KEY']
    end
  end
end
