Rails.application.routes.draw do

  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/login'
  get 'sessions/welcome'
  get 'users/new'
  get 'users/create'

  get 'guard/index'
  get 'spreadsheet/index'
  get 'users/profile'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create' 
  post 'logout', to: 'sessions#logout'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
#  get "/pages/:page" => "pages#show"

#use resources? https://guides.rubyonrails.org/getting_started.html
  resources :users, only: [:new, :create, :profile]

  root 'sessions#welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

