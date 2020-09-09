Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
   }
  root 'home#top'
  resources :users,only: [:show,:index,:edit,:update]
  get "user/show_follow/:id" => "users#show_follow", as: "user_show_follow"
  get "user/show_follower/:id" => "users#show_follower", as: "user_show_follower"
  get "search" => "searches#search"
  resources :relationships, only: [:create, :destroy]
  resources :books do
  	resource :favorites, only: [:create, :destroy]
  	resource :book_comments, only: [:create, :destroy]
  end
  get 'home/about'
end