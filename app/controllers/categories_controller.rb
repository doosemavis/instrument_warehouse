class CategoriesController < ApplicationController
    before_action :authenticate_user!

    def index
        @categories = current_user.categories 
    end

    def show
        @category = Category.find_by(id: params[:id])
        render :show
    end 

    def new
        @category = Category.new
    end

    def create
        @category = current_user.categories.build(category_params)

        if @category.save
            redirect_to categories_path
        else
            render :new
        end 
    end

    def edit
    end 

    def update
    end 

    def destroy
    end 


    private 

    def category_params
        params.require(:category).permit(:name, :user_id, :category_id)
    end 
end
