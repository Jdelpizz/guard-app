Rails.application.routes.draw do
  get 'guard/index'

  root 'guard#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
