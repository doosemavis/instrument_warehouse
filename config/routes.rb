Rails.application.routes.draw do
  root to: 'application#welcome'
  
  resources :categories
  resources :instruments
  
  devise_for :users, :controllers => {:registrations => "registrations", :omniauth_callbacks => "callbacks"}
  #change the route from /users/login to /login route
  
  devise_scope :user do 
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end 
end
