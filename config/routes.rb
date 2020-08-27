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

  resources :items do
    resources :delivery, only: [:index, :create, :new]
  end

  
end
