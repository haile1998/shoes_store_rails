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

  # get "admin/users" => "users#index"
  match "admin/users/:id/toggle", :to => "users#toggle", :as => "admin_users_toggle", :via => :put
  scope :admin do
    resources :users
  end

  get "admin/products" => "products#index"
  resources :products

  resources :carts

  resources :line_items
  root "home/homepage#index"
end
