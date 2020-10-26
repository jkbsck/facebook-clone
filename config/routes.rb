Rails.application.routes.draw do
  #match 'friendships/create', to: 'friendships#create', via: 'post'
  #get 'friendships/index'
  #delete 'friendships/destroy'
  # get 'friend_requests/new'
  # get 'friend_requests/index'
  # get 'friend_requests/create'
  # get 'friend_requests/destroy'
  # get 'friend_requests/update'
  # get 'friend_requests/edit'

  resources :friend_requests, except: [:show]

  resources :friendships, only: [:create, :index, :destroy]

  match '/send_request', to: 'friend_requests#new', via: 'get'
  match '/send_request', to: 'friend_requests#create', via: 'post'

  resources :posts
  
  devise_for :users, :controllers => { registrations: 'registrations' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
