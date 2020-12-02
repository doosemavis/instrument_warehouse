class CategoriesController < ApplicationController
    before_action :authenticate_user!

    def index 
        @categories = Categories.all
    end

    def show 
    end 

    def new
    end

    def create
    end

    def edit 
    end 

    def update
    end 

    def delete
    end 


    private 

    def category_params
        params.require(:category).permit(:name, :user_id, :category_id)
    end 
end
