class CategoriesController < ApplicationController
    before_action :authenticate_user!

    def index
        @categories = current_user.categories.uniq
    end

    def show
        @category = current_user.categories.find_by(id: params[:id])
        render :show
    end 

    def new
        @category = Category.new
    end

    def create
        @category = current_user.categories.build(category_params)
        binding.pry
        if @category.save
            redirect_to categories_path
        else
            render :new
        end 
    end


    private 

    def category_params
        params.require(:category).permit(:name, :user_id, :category_id)
    end 
end
