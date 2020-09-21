class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :current, :hourly_info, :weekly_info, :location
end
