Rails.application.routes.draw do
  resources :ideas do
    resources :discusses
  end

  root 'ideas#index'

  devise_for :users,
    parh: '',
    controllers: {registration:'registration'}

  #get '/users/:id', to: "users#show"
  resources :users, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
