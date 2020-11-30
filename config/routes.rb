Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  #change the route from /users/login to /login route

  devise_scope :user do 
    get 'login', to: 'devise/sessions#new'
  end 

  devise_scope :user do 
    get 'signup', to: 'devise/registrations#new'
  end 
  
end
