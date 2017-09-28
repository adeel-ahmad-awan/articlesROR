Rails.application.routes.draw do

  root "page#home"

  resources :articles
  get "/page/home" => "page#home"
  get "/page/about" => "page#about"

  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :catagories, except: [:destroy]

end
