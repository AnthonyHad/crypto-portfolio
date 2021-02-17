Rails.application.routes.draw do
  devise_for :users
  root to: 'users#show' # 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  resources :coins, only: [:index, :new, :create]
  resources :investments
end
