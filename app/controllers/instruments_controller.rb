class InstrumentsController < ApplicationController

    def index 
        @instruments = current_user.instruments
    end 

    def show
    end 

    def new
        @instrument = Instrument.new(user_id: params[:id])
    end

    def create
        @instrument = current_user.instrument.build(instrument_params)
        render :new
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
