Rails.application.routes.draw do
  resources :songs, only: [:index]
 
  root 'home#index'
end
