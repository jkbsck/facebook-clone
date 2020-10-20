Rails.application.routes.draw do
  get 'friend_requests/new'
  get 'friend_requests/index'
  get 'friend_requests/create'
  get 'friend_requests/destroy'
  get 'friend_requests/update'
  get 'friend_requests/edit'
  resources :posts
  devise_for :users, :controllers => { registrations: 'registrations' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
