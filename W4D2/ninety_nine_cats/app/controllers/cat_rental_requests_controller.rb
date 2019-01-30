class CatRentalRequestsController < ApplicationController

    def new
        render :new
    end

    def create
        @cat_rental_request = CatRentalRequest.new(crr_params)

        if @cat_rental_request.save
            redirect_to 
    end

    private
    
    def crr_params 
        params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date, :status)
    end
end