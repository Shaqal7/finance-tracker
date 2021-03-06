Rails.application.routes.draw do

  devise_for :users, controllers: { registration: "user/registrations" }
  resources :user_stocks, only: [:create, :destroy]
  resources :users, only: [:show]
  resources :friendships

  root 'welcome#index'
  get 'user_stocks/create'
  get 'my_portfolio', to: "users#my_portfolio"
  get 'search_stocks', to: "stocks#search"
  get 'search_friends', to: "users#search"
  get 'my_friends', to: "users#my_friends"
  post 'add_friend', to: "users#add_friend"
end
