class InstrumentsController < ApplicationController

    def index 
        @instruments = Instruments.all
    end 




    private 

    def instrument_params
        params.require(:instrument).permit(:name, :price, :weight, :description, :user_id, :category_id, :category_attributes[:name] )
    end 
end
