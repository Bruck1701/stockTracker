Rails.application.routes.draw do
  
  resources :user_invs, only: [:create, :destroy]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_investment', to: 'investments#search'

  root to: "pages#index"


end
