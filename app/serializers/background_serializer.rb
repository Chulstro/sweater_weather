class BackgroundSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location, :credit, :image_url
end
