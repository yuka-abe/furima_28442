Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
  }

  root to: "items#index"
  post '/items', to: "items#create"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_scope :user do 
    get 'sign_in', :to => 'devise/sessions#new'
    get 'sign_out', :to => 'devise/sessions#destroy'
  end 

  resources :items, only: [:index, :new, :create, :show] do
  end
  resources :category, only: :show
  resources :status, only: :show
  resources :delivery_fee, only: :show
  resources :days, only: :show
  resources :area, only: :show
end
