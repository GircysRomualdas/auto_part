Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: "admins/sessions"
  }
  devise_for :sellers, controllers: {
    sessions: "sellers/sessions"
  }
  devise_for :customers, controllers: {
    sessions: "customers/sessions"
  }

  root "car_part#index"
end
