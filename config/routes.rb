Ritly::Application.routes.draw do

  root to: "site#index"
  get "/", to: "site#index"
  get "/about", to: "site#about"

#go controller

  get "/go", to: "go#index", as: :go_index

  get "/go/new", to: "go#new", as: :go_new

  get "/go/:rand_str", to: "go#redirect", as: :go_show
  
  get "/go/:rand_str/preview", to: "go#preview", as: :go_preview
  
  post "/go", to: "go#create"

  delete "go/:rand_str", to: "go#delte", as: :go_delete


end
