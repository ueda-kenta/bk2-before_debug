Rails.application.routes.draw do
  devise_for :users
  root 'home#top'
  resources :users,only: [:show,:index,:edit,:update]
  get "user/show_follow/:id" => "users#show_follow", as: "user_show_follow"
  get "user/show_follower/:id" => "users#show_follower", as: "user_show_follower"
  resources :relationships, only: [:create, :destroy]
  resources :books do
  	resource :favorites, only: [:create, :destroy]
  	resource :book_comments, only: [:create, :destroy]
end
  get 'home/about'
end