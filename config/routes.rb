Rails.application.routes.draw do
  get 'spreadsheet/index'
  get "/pages/:page" => "pages#show"
end