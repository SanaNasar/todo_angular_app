Rails.application.routes.draw do
  
  resources :games, except: [:new, :edit]
  resources :items

  match "*path", to: "games#index", via: "get"

  root 'games#index'
end
