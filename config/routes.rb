Rails.application.routes.draw do
  resources :part_types
  resources :car_parts

  namespace :customer do
    resources :orders
    resources :carts
    resources :cart_items
  end

  namespace :seller do
    resources :orders
    resources :car_parts do
      resources :stocks
    end
    resources :car_models, only: [] do
      collection do
        get :by_brand
      end
    end
  end

  namespace :admin do
    resources :orders
    resources :car_models
    resources :car_brands
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

  get "customer/profile", to: "customer#show"

  get "admin", to: "admin#index"
  get "admin/profile", to: "admin#show"

  get "seller", to: "seller#index"
  get "seller/profile", to: "seller#show"

  get "home", to: "home#index"
  root "home#index"
end
