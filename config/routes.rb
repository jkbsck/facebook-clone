Rails.application.routes.draw do

  resources :friend_requests, except: [:show]

  resources :friendships, only: [:create, :index, :destroy]

  match '/send_request', to: 'friend_requests#new', via: 'get'
  match '/send_request', to: 'friend_requests#create', via: 'post'

  resources :posts

  resources :likes, only: [:create, :destroy]

  resources :comments, only: [:create, :destroy]

  resource :profile, only: [:show, :edit, :update]
  
  devise_for :users, :controllers => { registrations: 'registrations' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
