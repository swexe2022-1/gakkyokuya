Rails.application.routes.draw do
  root 'top#top'
  
  resources :users,      only: %i[show new create]
  resources :tracks,     only: %i[index show new create destroy]
  resources :playlists,  only: %i[index show new create destroy]
  resources :belongings, only: %i[create] 
  post 'playlists/:id/add_track',    to:'playlists#add_track'
  post 'playlists/:id/remove_track' ,to:'playlists#remove_track'
  
  get    '/signin', to: 'users#new'
  post   '/signin', to: 'users#create'
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  get 'get_track_image/:id',    to: 'tracks#get_track_image'
  get 'get_playlist_image/:id', to: 'playlists#get_playlist_image'
  get 'get_music/:id',          to: 'tracks#get_music'
end
