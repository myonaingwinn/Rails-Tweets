Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "main#index"
  get "about-us", to: "about#index", as: :about

  get "sign_up", to: "registeration#new"
  post "register", to: "registeration#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "password", to: "password#edit", as: :edit_password
  patch "password", to: "password#update"

  get "password/reset", to: "password_reset#new"
  post "password/reset", to: "password_reset#create"
  get "password/reset/edit", to: "password_reset#edit"
  patch "password/reset/edit", to: "password_reset#update"
end
