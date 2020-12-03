class InstrumentsController < ApplicationController
    before_action :authenticate_user!

    def index 

        if params[:category_id]
            @instruments = current_user.instruments.where(category_id: params[:category_id])
            @category = current_user.categories.find_by(id: params[:category_id])
        else 
            @instruments = current_user.instruments
        end 
    end 

    def show
        @instrument = current_user.instruments.find_by(id: params[:id])
    end 

    def new
        @instrument = Instrument.new(user_id: params[:id])
    end

    def create
        @instrument = current_user.instruments.build(instrument_params)
        
        if @instrument.save
            redirect_to @instrument
        else
            render :new 
        end 
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
