Rails.application.routes.draw do
  devise_for :users
  root 'home#top'
  resources :users,only: [:show,:index,:edit,:update]
   resources :relationships, only: [:create, :destroy]
  resources :books do
  	resource :favorites, only: [:create, :destroy]
  	resource :book_comments, only: [:create, :destroy]
end
  get 'home/about'
end