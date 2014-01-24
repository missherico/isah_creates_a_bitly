Ritly::Application.routes.draw do

  root to: "site#index"
  get "/", to: "site#index"
  get "/about", to: "site#about"

#go controller

  get "/go", to: "go#index", as: :go_index

  get "/go/new", to: "go#new", as: :go_new

  get "/go/:id", to: "go#show", as: :go_show
  
  get "/go/:id/edit", to: "go#edit", as: :go_edit

  get "/go/:id/preview", to: "go#preview", as: :go_preview
  
  post "/go", to: "go#create"

  patch "/go/:id", to: "go#update"



end
