Rails.application.routes.draw do

namespace :api do
  namespace :v1 do
    get '/forecast', to: 'forecast#index'
    get '/climbing_routes', to: 'routes#index'
  end
end
end
