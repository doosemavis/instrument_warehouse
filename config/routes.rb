Rails.application.routes.draw do
  resources :instruments
  devise_for :users, :controllers => {:registrations => "registrations", :omniauth_callbacks => "callbacks"}
  #change the route from /users/login to /login route

  devise_scope :user do 
    get 'login', to: 'devise/sessions#new'
  end 

  devise_scope :user do 
    get 'signup', to: 'devise/registrations#new'
  end 


end
