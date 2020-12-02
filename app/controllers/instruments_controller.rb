class InstrumentsController < ApplicationController

    def index 
        @instruments = Instruments.all
    end 
end
