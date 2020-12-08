Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations", :omniauth_callbacks => "callbacks"}
  root to: 'application#welcome'
  get 'instruments/search_term/:search_term', to: 'instruments#index'

  resources :categories
  resources :instruments

  resources :categories do 
    resources :instruments
  end 
  
  #change the route from /users/login to /login route
  devise_scope :user do 
    get 'login', to: 'devise/sessions#new', as: 'login'
    get 'signup', to: 'devise/registrations#new', as: 'signup'
  end 
end
