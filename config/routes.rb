Rails.application.routes.draw do
  root 'top#index'

  devise_for :users
  resources :users, only: [:edit, :update, :show]
  resources :rooms do
    resources :reservations, only: [:create]
  end

  resources :reservations, only: [:index, :show] do
    member do
      get :confirm
    end
  end
end
