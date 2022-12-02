Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get "/coffee", to: "coffee#index"
  # get "/coffee/:id", to: "coffee#show"
  # post "/coffee", to: "coffee#create"
  # put "/coffee/:id", to: "coffee#update"
  
  resources :baristers, only: [:index, :show, :create] do
    resources :coffee, only: [:index, :show, :create]
  end
  
  resources :coffee, only: [:index, :show, :create]

  get "/cookies", to: "sessions#index"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  
end
