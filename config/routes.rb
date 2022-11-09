Rails.application.routes.draw do
  get 'tracks/new'
  resources :tracks 
  root 'tracks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
