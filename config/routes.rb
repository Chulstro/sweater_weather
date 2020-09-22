Rails.application.routes.draw do

namespace :api do
  namespace :v1 do
    get '/forecast', to: 'forecast#index'
    get '/backgrounds', to: 'backgrounds#show'
    post '/users', to: 'users#create'
    post '/sessions', to: 'users#show'
  end
end
end
