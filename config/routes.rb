Rails.application.routes.draw do
  resources :part_types
  resources :car_parts

  namespace :seller do
    resources :car_parts
  end

  namespace :admin do
    resources :sellers
    resources :customers
    resources :part_types
    resources :car_parts
  end

  devise_for :sellers, controllers: {
    registrations: "devise_seller/registrations"
  }
  devise_for :admins, controllers: {
    registrations: "devise_admin/registrations"
  }
  devise_for :customers

  get "home", to: "home#index"
  get "admin", to: "admin#index"
  get "seller", to: "seller#index"

  root "home#index"
end
