Rails.application.routes.draw do
  
  get "novousuario", to: "users#new"
  resources :users, except: [:index]
  
  get "login", to: "sessions#new"
  delete "logout", to: "sessions#destroy"
  resources :sessions, only: [:create]
  
  get "welcome/index", to: "welcome#index"
  root "welcome#index"
end
