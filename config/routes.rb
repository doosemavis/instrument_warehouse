Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations", :omniauth_callbacks => "callbacks"}
  root to: 'application#welcome'
  
  resources :categories
  resources :instruments
  
  #change the route from /users/login to /login route
  devise_scope :user do 
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end 
end
