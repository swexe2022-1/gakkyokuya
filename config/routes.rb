Rails.application.routes.draw do
  root 'top#top'
  
  resources :users, only: %i[show new create]
  resources :tracks 
  resources :playlists
  post 'playlists/:id/add_track',to:'playlists#add_track'
  
  get    '/signin',  to: 'users#new'
  post   '/signin',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  get 'get_image/:id', to: 'tracks#get_image'
  get 'get_music/:id', to: 'tracks#get_music'
end
