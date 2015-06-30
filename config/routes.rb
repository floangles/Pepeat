Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :recipes

  resource :profile, only: [:show, :edit, :update]
end
