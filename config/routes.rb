Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"



  resources :offers
  resource :profile, only: [:show, :edit, :update]

  namespace :profile do
    resources :pepeatobookings, only: [:index, :show]
    resources :bookings, only: [:index, :show, :create, :new]
    resources :offers
    resources :recipes do
      resources :ingredients
      resources :categories
    end
  end

end
