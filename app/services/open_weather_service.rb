class OpenWeatherService

  def pull_forecast(location)
    to_json("onecall?lat=#{location[:lat]}&lon=#{location[:lng]}&exclude=minutely")
  end

  def current_weather(location)
    to_json("weather?lat=#{location[:lat]}&lon=#{location[:lng]}")
  end

  private

  def to_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('https://api.openweathermap.org/data/2.5/') do |f|
      f.params[:appid] = ENV['OPENWEATHER_KEY']
    end
  end
end
