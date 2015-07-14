Rails.application.routes.draw do
  resources :games, only: [:index, :show]
  resources :songs, only: [:index, :show]
 
  root 'home#index'
end
