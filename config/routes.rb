Rails.application.routes.draw do
  get 'tracks/new'
  resources :tracks 
  root 'tracks#index'
  
  get 'get_image/:id', to: 'tracks#get_image'
  get 'get_music/:id', to: 'tracks#get_music'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
