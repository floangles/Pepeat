Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"



  resources :offers
  resource :profile, only: [:show, :edit, :update]

  namespace :profile do
    resources :pepeatobookings, only: [:index, :show]
    resources :bookings, only: [:index, :show, :create, :new]
    resources :pepeatcommunity
    resources :offers
    resources :recipes do
      member do
        patch :like
      end

      resources :ingredients
      resources :categories
    end
  end

end
