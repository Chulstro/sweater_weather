class RoutesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :type, :rating, :location
end
