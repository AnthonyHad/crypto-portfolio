Rails.application.routes.draw do
  devise_for :users
  root to: 'coins#index' # 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  resources :coins, only: [:index, :new, :create]
  resources :investments, only: [:index, :new, :create, :edit, :update, :destroy]
  get "/investments/:coin_id", to: "investments#show"
end
