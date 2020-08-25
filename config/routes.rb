Rails.application.routes.draw do
  resources :ideas

  root 'ideas#index'

  devise_for :users

  #get '/users/:id', to: "users#show"
  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
