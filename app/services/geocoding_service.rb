class GeocodingService

  def city_to_latlon(location)
    results = to_json("address?location=#{location}")
    results[:results][0][:locations][0][:latLng]
  end

  def latlon_to_city(location)
    results = to_json("reverse?location=#{location[:lat]},#{location[:Lng]}")
  end

  private

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
