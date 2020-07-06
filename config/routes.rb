Rails.application.routes.draw do
  
  
  resources :user_invs, only: [:create, :destroy]
  devise_for :users
  root to: "pages#index"
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_investment', to: 'investments#search'
  get 'friends', to: 'users#friends'
  get 'search_friend', to: 'users#search'

  resources :friendships, only: [:create, :destroy]
  resources :users, only: [:show]

 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'about', to: 'pages#about'

  


end
