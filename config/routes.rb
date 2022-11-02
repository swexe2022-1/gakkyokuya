Rails.application.routes.draw do
  root 'top#top'
  
  resources :users, only: %i[show new create]
end
