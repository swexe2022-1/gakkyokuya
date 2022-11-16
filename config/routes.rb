Rails.application.routes.draw do
  root 'top#top'
  
  resources :users, only: %i[show new create]
  resources :tracks 
  get 'get_image/:id', to: 'tracks#get_image'
  get 'get_music/:id', to: 'tracks#get_music'
end
