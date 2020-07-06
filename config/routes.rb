Rails.application.routes.draw do
  
  
  resources :user_invs, only: [:create, :destroy]

  resources :friendships, only: [:create, :destroy]

  resources :users, only: [:show]

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'about', to: 'pages#about'

  get 'friends', to: 'users#friends'
  
  get 'my_portfolio', to: 'users#my_portfolio'

  get 'search_investment', to: 'investments#search'
  
  get 'search_friend', to: 'users#search'

  root to: "pages#index"


end
