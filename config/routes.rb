Rails.application.routes.draw do
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }
  devise_for :seller, controllers: {
    sessions: "seller/sessions"
  }
  devise_for :customer, controllers: {
    sessions: "customer/sessions"
  }
  get "home", to: "pages#home"
  get "for_seller", to: "pages#for_seller"
  get "for_admin", to: "pages#for_admin"

  resources :customers
  resources :sellers

  root "pages#home"
end
