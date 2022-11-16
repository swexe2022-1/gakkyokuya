Rails.application.routes.draw do
  

  post 'playlists/:id/add_track',to:'playlists#add_track'
  root 'top#top'
  
  resources :users, only: %i[show new create]
  resources :tracks 
  resources :playlists
  get 'get_image/:id', to: 'tracks#get_image'
  get 'get_music/:id', to: 'tracks#get_music'
end
