class ApplicationController < ActionController::Base
    before_action :current_user
    
    def welcome
    end 
end
