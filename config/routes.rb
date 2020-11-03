Rails.application.routes.draw do

  resources :friend_requests, except: [:show]

  resources :friendships, only: [:create, :index, :destroy]

  match '/send_request', to: 'friend_requests#new', via: 'get'
  match '/send_request', to: 'friend_requests#create', via: 'post'

  resources :posts

  resources :likes, only: [:create, :destroy]

  resources :comments, only: [:create, :destroy]

  resource :profile, only: [:show, :edit, :update]
  
  devise_for :users, :controllers => { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  
  # This part is yet to be implemented
  # devise_scope :user do
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html 
end
