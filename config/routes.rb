Ritly::Application.routes.draw do

  get "sessions/new"
  get "sessions/destroy"
  get "users/new"
  get "users/show"
  get "users/create"
  root to: "site#index"
  get "/", to: "site#index"
  get "/about", to: "site#about"

#go controller

  get "/go", to: "go#index", as: :go_index

  get "/go/new", to: "go#new", as: :go_new

  get "/go/:rand_str", to: "go#redirect", as: :go_show
  
  get "/go/:rand_str/preview", to: "go#preview", as: :go_preview
  
  post "/go", to: "go#create"

  delete "go/:rand_str", to: "go#destroy", as: :go_delete

resources :users

  get '/signup', to: 'users#new'

  delete '/signout', to: 'sessions#destroy'

  get '/signin', to: 'sessions#new'

 

end
