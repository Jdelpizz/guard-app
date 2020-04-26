Rails.application.routes.draw do

  get 'buglemaster/bugleschedule'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/login'
  get 'sessions/welcome'
  get 'users/new'
  get 'users/create'
  get 'guard/index'

  get 'guard/cadets'
  get "/pages/:page" => "pages#show"
  
  resources :users, only: [:new, :create]
  resources :cadets, only: [:show, :index, :new, :create, :edit, :update, :destroy]


  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create' 
  post 'logout', to: 'sessions#logout'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  #use resources? https://guides.rubyonrails.org/getting_started.html

  root 'sessions#welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end