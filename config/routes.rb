Rails.application.routes.draw do
  resources :songs, only: [:index, :show]
 
  root 'home#index'
end
