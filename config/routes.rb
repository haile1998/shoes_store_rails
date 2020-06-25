Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  get "admin" => "admin/adminpage#index"
  namespace :admin do
    resources :adminpage
  end

  get "home" => "home/homepage#index"
  namespace :home do
    resources :homepage
  end
  resources :users
  root "home/homepage#index"
end
