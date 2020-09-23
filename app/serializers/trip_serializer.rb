class TripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :origin, :destination, :weather, :travel_time
end
