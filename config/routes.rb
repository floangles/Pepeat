Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :recipes

  resource :profile, only: [:show, :edit, :update]

  namespace :profile do

    resources :bookings, only: [:index, :show]
    resources :recipes do
      resources :ingredients
      resources :categories
    end
  end

end
