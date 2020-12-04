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
        if params[:category_id]
            @category = current_user.categories.find_by(id: params[:category_id])
            @instrument = current_user.instruments.build(category_id: params[:category_id])
        else 
            @instrument = current_user.instruments.build
        end 
    end

    def create
        # binding.pry
        @instrument = current_user.instruments.build(instrument_params)
        # binding.pry
        if @instrument.save
            redirect_to @instrument
        else
            render :new 
        end 
    end 

    def edit
        @instrument = Instrument.find_by(id: params[:id])
    end 

    def update
        @instrument = current_user.instruments.update(instrument_params)

        if @instrument
            redirect_to instrument_path
        else 
            render :edit
        end 
    end 

    def destroy
        @instrument = current_user.instruments.find_by(id: params[:id])
        
        if @instrument
            @instrument.destroy 
        end 

        redirect_to instruments_path
    end 


    private 

    def instrument_params
        params.require(:instrument).permit(:name, :price, :weight, :description, :user_id, :category_id, category_attributes: [:name])
    end 
end
