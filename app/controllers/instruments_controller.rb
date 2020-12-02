class InstrumentsController < ApplicationController

    def index 
        @instruments = Instruments.all
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

    def instrument_params
        params.require(:instrument).permit(:name, :price, :weight, :description, :user_id, :category_id, :category_attributes [:name])
    end 
end
