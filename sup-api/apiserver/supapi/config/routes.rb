Rails.application.routes.draw do
  resources :records
  resources :players, param: :player_id
  namespace :api, {format: 'json'} do
    namespace :v1 do
       resources :players, param: :player_id
    end
  end
end
