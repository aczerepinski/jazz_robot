Rails.application.routes.draw do

  concern :jammable do
    resource :jam, only: [:show]
  end

  resources :games, only: [:index, :show]
  
  resources :songs, only: [:index, :show], concerns: :jammable

 
  root 'home#index'
end


