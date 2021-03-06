class BandsController < ApplicationController
  def new
    render :new 
  end

  def index
    render :index
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to bands_url
    else
      flash[:errors] = @bands.errors.full_messages
      redirect_to new_band_url
    end
  end

  def edit
    band = Band.find_by(name: params[])    

  end 

  def destroy
    
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end
end
