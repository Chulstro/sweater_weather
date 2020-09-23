class GeocodingService

  def city_to_latlon(location)
    to_json("geocoding/v1/address?location=#{location}")
    # {
    # coord: results[:results][0][:locations][0][:latLng],
    # city: "#{city(results)},#{state(results)}"
    # }
  end

  def distance_between(point_1, point_2)
    to_json("directions/v2/route?from=#{point_1}&to=#{point_2}")
  end

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
    Faraday.new('http://www.mapquestapi.com/') do |f|
      f.params[:key] = ENV['GEOCODING_KEY']
    end
  end
end
