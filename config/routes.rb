Rails.application.routes.draw do
  root 'top#index'

  devise_for :users
  resources :users, only: [:edit, :update, :show] do
    member do
      get 'edit_account'
      get 'edit_profile'
    end
  end
  
  resources :rooms do
    collection do
      get :search
      get :area_search
    end
    resources :reservations, only: [:new, :create, :index, :show] do
      collection do
        get :confirm
      end
    end
  end

  resources :reservations, only: [:index, :show]
end
