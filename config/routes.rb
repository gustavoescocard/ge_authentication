Rails.application.routes.draw do
  get "welcome/index"
  get "login" => "sessions#new"

  get "novousuario" => "users#new"
  resources :users, except: [:index]

  resources :sessions, only: [:create, :destroy]

  resources :app, only: [:index]
  root "welcome#index"
end
