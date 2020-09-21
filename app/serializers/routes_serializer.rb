class RoutesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :routes, :location, :forecast
end
