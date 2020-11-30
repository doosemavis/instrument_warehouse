class RegistrationsController < Devise::RegistrationsController
#this method overwrites the signup and account_update params shipped with devise
#to accept the name attribute that we added recently to the migration user table
    
    private

    def signup_params
        params.require(:user).permit( 
            :name,
            :email,
            :password
            :password_confirmation)
    end 

    def account_update_params
        params.require(:user).permit(
            :name,
            :email,
            :password,
            :password_confirmation,
            :current_password)

    end 
end 