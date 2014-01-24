Ritly::Application.routes.draw do

  root to: "site#index"
  get "/", to: "site#index"


#go controller

  get "/go", to: "go#index", as: :go_index

  get "/go/:id", to: "go#show", as: :go_show

  get "/go/:preview", to: "go#preview", as: :go_preview
  
  post "/go", to: "go#create", as: :go_create




end
