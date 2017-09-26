Rails.application.routes.draw do

  resources :articles
  get "/page/home" => "page#home"
  get "/page/about" => "page#about"

  root "page#home"

end
