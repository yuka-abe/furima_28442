Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
  }

  root to: "items#index"


  devise_scope :user do 
    get 'sign_in', :to => 'devise/sessions#new'
    get 'sign_out', :to => 'devise/sessions#destroy'
  end 

  resources :items, only: [:index, :new, :create, :show, :edit] do
    resources :show, only: [:index, :create]
  
  resources :category, only: :show
  resources :status, only: :show
  resources :delivery_fee, only: :show
  resources :days, only: :show
  resources :area, only: :show
  end
end
